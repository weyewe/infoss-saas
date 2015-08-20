class ShipmentOrderRouting < ActiveRecord::Base
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
    new_object.airport_from_id = params[:airport_from_id]
    new_object.airport_to_id = params[:airport_to_id]
    new_object.city_location_id = params[:city_location_id]
    new_object.company_id = params[:company_id]
    new_object.etd = params[:etd]
    new_object.flight_id = params[:flight_id]
    new_object.flight_no = params[:flight_no]
    new_object.vessel_id = params[:vessel_id]
    new_object.vessel_name = params[:vessel_name]
    new_object.vessel_type = params[:vessel_type]
    new_object.voyage = params[:voyage]
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.airport_from_id = params[:airport_from_id]
    self.airport_to_id = params[:airport_to_id]
    self.city_location_id = params[:city_location_id]
    self.company_id = params[:company_id]
    self.etd = params[:etd]
    self.flight_id = params[:flight_id]
    self.flight_no = params[:flight_no]
    self.vessel_id = params[:vessel_id]
    self.vessel_name = params[:vessel_name]
    self.vessel_type = params[:vessel_type]
    self.voyage = params[:voyage]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
  
end
