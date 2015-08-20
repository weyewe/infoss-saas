class BillOfLading < ActiveRecord::Base
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
    new_object.agent_id = params[:agent_id]
    new_object.agent_name = params[:agent_name]
    new_object.agent_address = params[:agent_address]
    new_object.amount_insurance = params[:amount_insurance]
    new_object.bl_number = params[:bl_number]
    new_object.cargo_insurance = params[:cargo_insurance]
    new_object.company_id = params[:company_id]
    new_object.consignee_id = params[:consignee_id]
    new_object.consignee_name = params[:consignee_name]
    new_object.consignee_address = params[:consignee_address]
    new_object.description = params[:description]
    new_object.freight_amount = params[:freight_amount]
    new_object.freight_payable_at = params[:freight_payable_at]
    new_object.hawb_fee = params[:hawb_fee]
    new_object.master_bl_id = params[:master_bl_id]
    new_object.no_of_bl = params[:no_of_bl]
    new_object.nparty_id = params[:nparty_id]
    new_object.nparty_name = params[:nparty_name]
    new_object.nparty_address = params[:nparty_address]
    new_object.place_date_issue = params[:place_date_issue]
    new_object.shipment_on_board = params[:shipment_on_board]
    new_object.shipper_id = params[:shipper_id]
    new_object.shipper_name = params[:shipper_name]
    new_object.shipper_address = params[:shipper_address]
    new_object.total_no_container = params[:total_no_container]
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.agent_id = params[:agent_id]
    self.agent_name = params[:agent_name]
    self.agent_address = params[:agent_address]
    self.amount_insurance = params[:amount_insurance]
    self.bl_number = params[:bl_number]
    self.cargo_insurance = params[:cargo_insurance]
    self.company_id = params[:company_id]
    self.consignee_id = params[:consignee_id]
    self.consignee_name = params[:consignee_name]
    self.consignee_address = params[:consignee_address]
    self.description = params[:description]
    self.freight_amount = params[:freight_amount]
    self.freight_payable_at = params[:freight_payable_at]
    self.hawb_fee = params[:hawb_fee]
    self.master_bl_id = params[:master_bl_id]
    self.no_of_bl = params[:no_of_bl]
    self.nparty_id = params[:nparty_id]
    self.nparty_name = params[:nparty_name]
    self.nparty_address = params[:nparty_address]
    self.place_date_issue = params[:place_date_issue]
    self.shipment_on_board = params[:shipment_on_board]
    self.shipper_id = params[:shipper_id]
    self.shipper_name = params[:shipper_name]
    self.shipper_address = params[:shipper_address]
    self.total_no_container = params[:total_no_container]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
  
end
