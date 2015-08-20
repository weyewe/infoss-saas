class PaymentVoucher < ActiveRecord::Base
  validates_presence_of :payment_date
  validates_presence_of :due_date
  validate :valid_cash_bank
  validate :valid_contact
  belongs_to :contact
  belongs_to :cash_bank
  belongs_to :exchange
  has_many :payment_voucher_details
  
  
  def self.active_objects
    self
  end
  
  def active_children
    self.payment_voucher_details
  end
  
  def valid_contact
    return if  contact_id.nil?
    ct = Contact.find_by_id contact_id
    
    if ct.nil? 
      self.errors.add(:contact_id, "Harus ada contact id")
      return self 
    end
  end 
  
  def valid_cash_bank
    return if  cash_bank_id.nil?
    cb = CashBank.find_by_id cash_bank_id
    
    if cb.nil? 
      self.errors.add(:cash_bank_id, "Harus ada CashBank id")
      return self 
    end
  end 
  
  def self.create_object(params)
    new_object = self.new
    new_object.reference = params[:reference]
    new_object.due_date = params[:due_date]
    new_object.payment_date = params[:payment_date]
    new_object.contact_id = params[:contact_id]
    new_object.cash_bank_id = params[:cash_bank_id]
    new_object.save
    if new_object.save
      new_object.code = "PV-" + new_object.id.to_s
      if new_object.cash_bank.exchange.is_base == true
        new_object.rate_to_idr = 1
      end
      new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    if self.payment_voucher_details.count > 0
      self.errors.add(:generic_errors, "Sudah memiliki detail")
      return self 
    end 
    
    self.reference = params[:reference]
    self.due_date = params[:due_date]
    self.payment_date = params[:payment_date]
    self.contact_id = params[:contact_id]
    self.cash_bank_id = params[:cash_bank_id]
    if self.save
      if self.cash_bank.exchange.is_base == true
        self.rate_to_idr = 1
      end
    end
    return self
  end
  
  def delete_object
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    if self.payment_voucher_details.count > 0
      self.errors.add(:generic_errors, "Sudah memiliki detail")
      return self 
    end 
    self.destroy
    return self
  end
  
  def update_cash_bank_amount(amount)
    cb = CashBank.find_by_id(self.cash_bank_id)
    cb.update_amount(amount)
  end
  
  def generate_cash_mutation(total)
      CashMutation.create_object(
        :source_class => self.class.to_s, 
        :source_id => self.id ,  
        :source_code => self.code,
        :amount => total ,  
        :status => ADJUSTMENT_STATUS[:deduction],  
        :mutation_date => self.confirmed_at ,  
        :cash_bank_id => self.cash_bank_id 
       ) 
  end
  
  def delete_cash_mutation
     CashMutation.where(
        :source_class => self.class.to_s, 
        :source_id => self.id 
      ).each {|x| x.delete_object  }
  end
  
  def update_total_amount_idr(total_amount_idr)
    self.total_amount_idr = total_amount_idr
    self.save
  end
  
  def update_total_amount_usd(total_amount_usd)
    self.total_amount_usd = total_amount_usd
    self.save
  end
  
  def confirm_detail
    self.payment_voucher_details.each do |pvd|
      pyb = Payable.find_by_id(pvd.payable_id)
      pyb.update_remaining_amount(pvd.amount * -1)
      pyb.set_completed_payable
    end
  end
  
  def unconfirm_detail
    self.payment_voucher_details.each do |pvd|        
      pyb = Payable.find_by_id(pvd.payable_id)
      pyb.update_remaining_amount(pvd.amount)
      pyb.set_completed_payable
    end
  end
  
  def confirm_object(params)
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    if self.payment_voucher_details.count == 0
      self.errors.add(:generic_errors, "Tidak memiliki detail")
      return self 
    end 
    total = 0
    if self.cash_bank.exchange_id == CURRENCY[:idr] 
      if self.total_amount_idr > self.cash_bank.amount 
        self.errors.add(:generic_errors, "Dana tidak mencukupi")
        return self 
      end
      total = self.total_amount_idr
    else
      if self.total_amount_usd > self.cash_bank.amount 
        self.errors.add(:generic_errors, "Dana tidak mencukupi")
        return self 
      end
      total = self.total_amount_usd
    end
    self.is_confirmed = true
    self.confirmed_at = params[:confirmed_at]
    if self.save
      self.confirm_detail
      self.generate_cash_mutation(total)
      self.update_cash_bank_amount(total * -1)
    end
    return self
  end
  
  def unconfirm_object
    if not self.is_confirmed?
      self.errors.add(:generic_errors, "belum di konfirmasi")
      return self 
    end
    total = 0
    if self.cash_bank.exchange_id == CURRENCY[:idr] 
      total = self.total_amount_idr
    else
      total = self.total_amount_usd
    end
    self.is_confirmed = false
    self.confirmed_at = nil
    if self.save
        self.unconfirm_detail
        self.delete_cash_mutation()
        self.update_cash_bank_amount(total)
    end
    return self
  end
  
end
