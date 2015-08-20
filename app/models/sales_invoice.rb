class SalesInvoice < ActiveRecord::Base
  
  belongs_to :contact
  belongs_to :shipment_order
  has_many :sales_invoice_details
  validates_presence_of :contact_id
  validates_presence_of :invoice_date
  validates_presence_of :shipment_order_id
 
  validate :valid_contact
  validate :valid_shipment_order
  
  
  def self.active_objects
    self
  end
  
  def active_children
    self.sales_invoice_details 
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

  def self.create_object( params )
    new_object = self.new
    new_object.shipment_order_id = params[:shipment_order_id]
    new_object.invoice_date = params[:invoice_date]
    new_object.description = params[:description]
    new_object.due_date = params[:due_date]
    new_object.contact_id = params[:contact_id]
    new_object.contact_name = params[:contact_name]
    new_object.contact_address = params[:contact_address]
    new_object.bill_id = params[:bill_id]
    new_object.bill_name = params[:bill_name]
    new_object.bill_address = params[:bill_address]
    if new_object.save  
      new_object.code = "SI-" + new_object.id.to_s  
      new_object.save
    end
    return new_object
  end
  
  def update_object( params ) 
    if self.is_confirmed? 
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self
    end
    if self.sales_invoice_details.count > 0
      self.errors.add(:generic_errors, "Sudah memiliki detail")
      return self 
    end
    self.shipment_order_id = params[:shipment_order_id]
    self.invoice_date = params[:invoice_date]
    self.nomor_surat = params[:nomor_surat]
    self.description = params[:description]
    self.due_date = params[:due_date]
    self.contact_id = params[:contact_id]
    self.contact_name = params[:contact_name]
    self.contact_address = params[:contact_address]
    self.bill_id = params[:bill_id]
    self.bill_name = params[:bill_name]
    self.bill_address = params[:bill_address]
    if self.save 
    end
    return self
  end
    
  def confirm_object( params )  
    if self.is_confirmed? 
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self
    end
    
    if self.sales_invoice_details.count == 0
      self.errors.add(:generic_errors, "Tidak memiliki detail")
      return self 
    end
    
    if params[:confirmed_at].nil?
      self.errors.add(:generic_errors, "Harus ada tanggal konfirmasi")
      return self 
    end    
    latest_exchange_rate = ExchangeRate.get_latest(
      :ex_rate_date => self.invoice_date
      )
    if not latest_exchange_rate.nil?
      self.exchange_rate_id = latest_exchange_rate.id
      self.exchange_rate_amount = latest_exchange_rate.rate
    end
    self.confirmed_at = params[:confirmed_at]
    self.is_confirmed = true  
    
    if self.save 
      self.generate_receivable  
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
      self.delete_receivable
    end
    return self
  end
   
  
  def delete_object
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    
    if self.sales_invoice_details.count > 0
      self.errors.add(:generic_errors, "Sudah memiliki detail")
      return self 
    end
    
    self.destroy
    return self
  end
  
  
  def generate_receivable
    self.sales_invoice_details.each do |sid|
    Receivable.create_object(
      :source_class => self.class.to_s, 
      :source_id => self.id ,  
      :contact_id => self.contact_id,
      :shipment_order_id => self.shipment_order_id,
      :description => sid.description,
      :amount => sid.amount ,  
      :due_date => self.due_date ,  
      :exchange_id => sid.exchange_id,
      :exchange_rate_amount => self.exchange_rate_amount,
      :source_code => self.code
    ) 
    end
  end
  
  def delete_receivable
    rcb = Receivable.where(
      :source_id =>self.id,
      :source_class => self.class.to_s, 
      )
    rcb.each do |x|
     x.delete_object
    end
  end 
  
  
end
