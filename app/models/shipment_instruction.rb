class ShipmentInstruction < ActiveRecord::Base
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
    new_object.attention = params[:attention]
    new_object.collect_address = params[:collect_address]
    new_object.collect_at = params[:collect_at]
    new_object.collect_name = params[:collect_name]
    new_object.company_id = params[:company_id]
    new_object.consignee_address = params[:consignee_address]
    new_object.consignee_id = params[:consignee_id]
    new_object.consignee_name = params[:consignee_name]
    new_object.freight_agreed = params[:freight_agreed]
    new_object.good_description = params[:good_description]
    new_object.n_party_address = params[:n_party_address]
    new_object.n_party_id = params[:n_party_id]
    new_object.n_party_name = params[:n_party_name]
    new_object.original_bl = params[:original_bl]
    new_object.shipper_address = params[:shipper_address]
    new_object.shipper_id = params[:shipper_id]
    new_object.shipper_name = params[:shipper_name]
    new_object.si_reference = params[:si_reference]
    new_object.special_instruction = params[:special_instruction]
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.attention = params[:attention]
    self.collect_address = params[:collect_address]
    self.collect_at = params[:collect_at]
    self.collect_name = params[:collect_name]
    self.company_id = params[:company_id]
    self.consignee_address = params[:consignee_address]
    self.consignee_id = params[:consignee_id]
    self.consignee_name = params[:consignee_name]
    self.freight_agreed = params[:freight_agreed]
    self.good_description = params[:good_description]
    self.n_party_address = params[:n_party_address]
    self.n_party_id = params[:n_party_id]
    self.n_party_name = params[:n_party_name]
    self.original_bl = params[:original_bl]
    self.shipper_address = params[:shipper_address]
    self.shipper_id = params[:shipper_id]
    self.shipper_name = params[:shipper_name]
    self.si_reference = params[:si_reference]
    self.special_instruction = params[:special_instruction]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
    
end
