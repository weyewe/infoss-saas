class ShipmentAdvice < ActiveRecord::Base
  belongs_to :shipment_order
  validates_presence_of :shipment_order_id 
  validate :valid_shipment_order
  
  def self.active_objects
    self
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
    new_object.shipment_order_id = params[:shipment_order_id]
    new_object.company_id = params[:company_id]
    new_object.reference = params[:reference]
    new_object.remarks = params[:remarks]
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.company_id = params[:company_id]
    self.reference = params[:reference]
    self.remarks = params[:remarks]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
    
    
    
end
