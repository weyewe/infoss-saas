class SeaContainer < ActiveRecord::Base
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
    new_object.cbm = params[:cbm]
    new_object.commodity = params[:commodity]
    new_object.company_id = params[:company_id]
    new_object.container_no = params[:container_no]
    new_object.gross_weight = params[:gross_weight]
    new_object.net_weight = params[:net_weight]
    new_object.no_of_pieces = params[:no_of_pieces]
    new_object.packaging_code = params[:packaging_code]
    new_object.part_of = params[:part_of]
    new_object.seal_no = params[:seal_no]
    new_object.size = params[:size]
    new_object.type = params[:type]
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.cbm = params[:cbm]
    self.commodity = params[:commodity]
    self.company_id = params[:company_id]
    self.container_no = params[:container_no]
    self.gross_weight = params[:gross_weight]
    self.net_weight = params[:net_weight]
    self.no_of_pieces = params[:no_of_pieces]
    self.packaging_code = params[:packaging_code]
    self.part_of = params[:part_of]
    self.seal_no = params[:seal_no]
    self.size = params[:size]
    self.type = params[:type]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
  
    
end
