class PaymentRequest < ActiveRecord::Base
  has_many :payment_request_details
  belongs_to :contact
  belongs_to :shipment_order
  validates_presence_of :shipment_order_id 

  
  validates_presence_of :contact_id
  validates_presence_of :request_date
   
  validate :valid_contact
  validate :valid_shipment_order
  
  def self.active_objects
    return self
  end
  
  def active_children
    return self.payment_request_details
  end
  
  def valid_contact
    return if contact_id.nil? 
    contact = Contact.find_by_id(contact_id)
    if contact.nil?
      self.errors.add(:contact_id, "Harus ada contact Id")
      return self
    end
  end
  
  def valid_shipment_order
    return if  shipment_order_id.nil?
    so = ShipmentOrder.find_by_id shipment_order_id
    
    if so.nil? 
      self.errors.add(:shipment_order_id, "Harus ada shipment order id")
      return self 
    end
  end 
  
  def self.create_object(params)
    new_object = self.new
    new_object.contact_id = params[:contact_id]
    new_object.shipment_order_id = params[:shipment_order_id]
    new_object.request_date = params[:request_date]
    new_object.due_date = params[:due_date]
    if new_object.save
      new_object.reference = "PR-" + new_object.id.to_s
      new_object.save
    end
    return new_object
  end
  
  def update_object( params ) 
    
    if self.is_confirmed? 
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self
    end
    
    if self.payment_request_details.count > 0
      self.errors.add(:generic_errors, "memiliki detail")
      return self 
    end
    
    self.contact_id = params[:contact_id]
    self.shipment_order_id = params[:shipment_order_id]
    self.request_date = params[:request_date]
    self.due_date = params[:due_date]
    if self.save
    end
    return self
  end
   
  
  def generate_payable
    self.payment_request_details.each do |prd|
      Payable.create_object(
        :source_class => self.class.to_s, 
        :source_id => self.id ,  
        :contact_id => self.contact_id,
        :shipment_order_id => self.shipment_order_id,
        :description => prd.description,
        :amount => prd.amount ,  
        :due_date => self.due_date ,  
        :exchange_id => prd.exchange_id,
        :exchange_rate_amount => self.exchange_rate_amount,
        :source_code => self.code
        )
    end
  end
  
  def delete_payable
    rvl = Payable.where(
      :source_id =>self.id,
      :source_class => self.class.to_s, 
      )
    rvl.each do |x|
     x.delete_object
    end
  end

  
  def confirm_object(params)
    if self.is_confirmed? 
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self
    end
    if self.payment_request_details.count == 0
      self.errors.add(:generic_errors, "Tidak memiliki detail")
      return self 
    end
    latest_exchange_rate = ExchangeRate.get_latest(
      :ex_rate_date => self.request_date
      )
    if not latest_exchange_rate.nil?
      self.exchange_rate_id = latest_exchange_rate.id
      self.exchange_rate_amount = latest_exchange_rate.rate
    end
    self.is_confirmed = true
    self.confirmed_at = params[:confirmed_at]
    if self.save  
      self.generate_payable 
    end
    return self
  end
  
  def unconfirm_object
    if not self.is_confirmed?
      self.errors.add(:generic_errors, "belum di konfirmasi")
      return self 
    end
    self.is_confirmed = false
    self.confirmed_at = nil
    if self.save
      self.delete_payable
    end
    return self
  end
  
  def delete_object
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
 
    if self.payment_request_details.count > 0
      self.errors.add(:generic_errors, "memiliki detail")
      return self 
    end
    
    self.destroy
    return self
  end
  
  def update_total_amount_usd(total_amount_usd)
    self.total_amount_usd = total_amount_usd
    self.save
    return self
  end
  
  def update_total_amount_idr(total_amount_idr)
    self.total_amount_idr = total_amount_idr
    self.save
    return self
  end
  
end
