class PaymentVoucherDetail < ActiveRecord::Base

  validate :valid_payable
  validate :valid_payment_voucher
  belongs_to :payable
  belongs_to :payment_voucher
  
  
  def self.active_objects
    self
  end
  
  def valid_payment_voucher
    return if  payment_voucher_id.nil?
    cb = PaymentVoucher.find_by_id payment_voucher_id
    if cb.nil? 
      self.errors.add(:payment_voucher_id, "Harus ada payment_voucher id")
      return self 
    end
  end 
   
  def valid_payable
    return if  payable_id.nil?
    pyb = Payable.find_by_id payable_id
    
    if pyb.nil? 
      self.errors.add(:payable_id, "Harus ada payable id")
      return self 
    end
    
    pvcount = PaymentVoucherDetail.where(
      :payment_voucher_id => payment_voucher_id,
      :payable_id => pyb.id
      ).count  
    
    if self.persisted?
       if pvcount > 1
         self.errors.add(:payable_id, "Payable sudah terpakai")
      return self 
       end
    else
       if pvcount > 0
         self.errors.add(:payable_id, "Payable sudah terpakai")
      return self 
       end
    end
  end 
  
  def calculateTotalAmount
    total_amount_idr = 0
    total_amount_usd = 0
    PaymentVoucherDetail.where(:payment_voucher_id =>payment_voucher_id).each do |pvd|
       if prd.payable.exchange_id == CURRENCY[:idr]
          total_amount_idr += pvd.amount_idr
       else
          total_amount_usd += pvd.amount_usd
       end
    end
    payment_voucher = PaymentVoucher.find_by_id(payment_voucher_id)
    payment_voucher.update_total_amount_idr(amount)
    payment_voucher.update_total_amount_usd(amount)
  end
  
  def self.create_object(params)
    new_object = self.new
    payment_voucher = PaymentVoucher.find_by_id(params[:payment_voucher_id])
    if not payment_voucher.nil?
      if payment_voucher.is_confirmed?
        new_object.errors.add(:generic_errors, "Sudah di konfirmasi")
        return new_object 
      end
      payable = Payable.find_by_id(params[:payable_id])
      if not payable.nil?
        if not payment_voucher.cash_bank.exchange_id == payable.exchange_id
          new_object.errors.add(:generic_errors, "Currency tidak sama")
          return new_object
        end
      end
    end
    new_object.payment_voucher_id = params[:payment_voucher_id]
    new_object.payable_id = params[:payable_id]
    new_object.description = params[:description]
    if new_object.save
      new_object.amount = new_object.payable.amount
      new_object.calculateTotalAmount
    end
    return new_object
  end
  
  def update_object(params)
    if self.payment_voucher.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    payable = Payable.find_by_id(params[:payable_id])
    if not payable.nil?
      if not self.payment_voucher.cash_bank.exchange_id == payable.exchange_id
        new_object.errors.add(:generic_errors, "Currency tidak sama")
        return new_object
      end
    end
    self.payable_id = params[:payable_id]
    self.description = params[:description]
    if self.save
      self.amount = self.payable.amount
    end
    return self
  end
  
  def delete_object
    if self.payment_voucher.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.destroy
    self.calculateTotalAmount
    return self
  end
  
end
