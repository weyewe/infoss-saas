class ShipmentOrder < ActiveRecord::Base
  has_many :shipment_order_routings
  has_many :sea_containers
  
  def self.active_objects
    self
  end
  
  def self.create_object(params)  
    new_object = self.new
    new_object.job_id = self.job_id
    new_object.sub_job_number = params[:sub_job_number]
    new_object.total_sub = params[:sub_job_number]
    new_object.si_reference = params[:si_reference]
    new_object.si_date = params[:si_date]
    new_object.load_status = params[:load_status]
    new_object.service_no_id = params[:service_no_id] 
    new_object.container_status = params[:container_status]
    new_object.shipment_status = params[:shipment_status]
    new_object.market_id = params[:market_id]
    new_object.market_company_id = params[:market_company_id]
    new_object.agent_id = params[:agent_id]
    new_object.agent_name = params[:agent_name]
    new_object.agent_address = params[:agent_addressage]
    new_object.delivery_id = params[:delivery_id]
    new_object.delivery_name = params[:delivery_name]
    new_object.delivery_address = params[:delivery_address]
    new_object.transhipment_id = params[:transhipment_id]
    new_object.transhipment_name = params[:transhipment_name]
    new_object.transhipment_address = params[:transhipment_address]
    new_object.shipper_id = params[:shipper_id]
    new_object.shipper_name = params[:shipper_name]
    new_object.shipper_address = params[:shipper_address]
    new_object.consignee_id = params[:consignee_id]
    new_object.consignee_name = params[:consignee_name]
    new_object.consignee_address = params[:consignee_address]
    new_object.nparty_id = params[:nparty_id]
    new_object.nparty_name = params[:nparty_name]
    new_object.nparty_address = params[:nparty_address]
    new_object.loading_port_code = params[:loading_port_code]
    new_object.loading_port_name = params[:loading_port_name]
    new_object.receipt_place_code = params[:receipt_place_code]
    new_object.receipt_place_name = params[:receipt_place_name]
    new_object.discharge_port_code = params[:discharge_port_code]
    new_object.discharge_port_name = params[:discharge_port_name]
    new_object.delivery_place_code = params[:delivery_place_code]
    new_object.delivery_place_name = params[:delivery_place_name]
    
    new_object.eta = params[:eta]
    new_object.etd = params[:etd]
    
    
    new_object.obl_status = params[:obl_status]
    new_object.obl_collect_id = params[:obl_collect_id]
    new_object.obl_payable_id = params[:obl_payable_id]
    new_object.hbl_status = params[:hbl_status]
    new_object.hbl_collect_id = params[:hbl_collect_id]
    new_object.hbl_payable_id = params[:hbl_payable_id]
    new_object.currency = params[:currency]
    new_object.handling_info = params[:handling_info]
    new_object.obl_currency = params[:obl_currency]
    new_object.hbl_currency = params[:hbl_currency] 
    new_object.obl_amount =  params[:obl_amount] 
    new_object.hbl_amount =  params[:obl_amount]
    
    new_object.good_description =  params[:good_description]
    new_object.ocean_mstbl_no =  params[:ocean_mstbl_no]
    new_object.house_bl_no =  params[:house_bl_no]
    new_object.second_bl_no =  params[:second_bl_no]
    new_object.volume_bl =  params[:volume_bl]
    new_object.volume_invoice =  params[:volume_invoice]
    new_object.warehouse_name =  params[:warehouse_name]
    new_object.kins =  params[:kins]
    new_object.cf_name =  params[:cf_name]
    
    new_object.ssline_id =  params[:ssline_id]
    new_object.broker_id =  params[:broker_id]
    new_object.depo_id =  params[:depo_id]
    
    new_object.departure_airport_code =  params[:departure_airport_code]
    new_object.departure_airport_name =  params[:departure_airport_name_]
    new_object.receipt_place_code =  params[:receipt_place_code]
    new_object.receipt_place_name =  params[:receipt_place_name]
    new_object.destination_airport_code =  params[:destination_airport_code]
    new_object.destination_airport_name =  params[:destination_airport_name]
    
    new_object.mawb_status =  params[:mawb_status]
    new_object.mawb_collect_id =  params[:mawb_collect_id]
    new_object.mawb_payable_id =  params[:mawb_payable_id]
    new_object.hawb_status =  params[:hawb_status]
    new_object.hawb_payable_id =  params[:hawb_payable_id]
    
    new_object.pieces_rcp =  params[:pieces_rcp]
    new_object.gross_weight =  params[:gross_weight]
    new_object.kglb =  params[:kglb]
    new_object.charge_weight =  params[:charge_weight]
    new_object.charge_rate =  params[:charge_rate]
    new_object.total =  params[:total]
    new_object.good_nature_quantity =  params[:good_nature_quantity]
    new_object.shipmark =  params[:shipmark]
    new_object.commodity =  params[:commodity]
    new_object.packaging_code =  params[:packaging_code]
    new_object.mawb_no =  params[:mawb_no]
    new_object.chargeable_weight =  params[:chargeable_weight]
    new_object.weight_hawb =  params[:weight_hawb]
    new_object.carriage_value =  params[:carriage_value]
    new_object.custome_value =  params[:custome_value]
    new_object.iata_id =  params[:iata_id]
    new_object.broker_id =  params[:broker_id]
    
    if new_object.save
      new_object.code = new_object.job_id.to_s + "-" + new_object.id.to_s  
      new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.job_id = self.job_id
    self.sub_job_number = params[:sub_job_number]
    self.total_sub = params[:sub_job_number]
    self.si_reference = params[:si_reference]
    self.si_date = params[:si_date]
    self.load_status = params[:load_status]
    self.service_no_id = params[:service_no_id] 
    self.container_status = params[:container_status]
    self.shipment_status = params[:shipment_status]
    self.market_id = params[:market_id]
    self.market_company_id = params[:market_company_id]
    self.agent_id = params[:agent_id]
    self.agent_name = params[:agent_name]
    self.agent_address = params[:agent_addressage]
    self.delivery_id = params[:delivery_id]
    self.delivery_name = params[:delivery_name]
    self.delivery_address = params[:delivery_address]
    self.transhipment_id = params[:transhipment_id]
    self.transhipment_name = params[:transhipment_name]
    self.transhipment_address = params[:transhipment_address]
    self.shipper_id = params[:shipper_id]
    self.shipper_name = params[:shipper_name]
    self.shipper_address = params[:shipper_address]
    self.consignee_id = params[:consignee_id]
    self.consignee_name = params[:consignee_name]
    self.consignee_address = params[:consignee_address]
    self.nparty_id = params[:nparty_id]
    self.nparty_name = params[:nparty_name]
    self.nparty_address = params[:nparty_address]
    self.loading_port_code = params[:loading_port_code]
    self.loading_port_name = params[:loading_port_name]
    self.receipt_place_code = params[:receipt_place_code]
    self.receipt_place_name = params[:receipt_place_name]
    self.discharge_port_code = params[:discharge_port_code]
    self.discharge_port_name = params[:discharge_port_name]
    self.delivery_place_code = params[:delivery_place_code]
    self.delivery_place_name = params[:delivery_place_name]
    
    self.eta = params[:eta]
    self.etd = params[:etd]
    
    self.obl_status = params[:obl_status]
    self.obl_collect_id = params[:obl_collect_id]
    self.obl_payable_id = params[:obl_payable_id]
    self.hbl_status = params[:hbl_status]
    self.hbl_collect_id = params[:hbl_collect_id]
    self.hbl_payable_id = params[:hbl_payable_id]
    self.currency = params[:currency]
    self.handling_info = params[:handling_info]
    self.obl_currency = params[:obl_currency]
    self.hbl_currency = params[:hbl_currency]
    self.obl_amount =  params[:obl_amount] 
    self.hbl_amount =  params[:obl_amount]
    
    self.good_description =  params[:good_description]
    self.ocean_mstbl_no =  params[:ocean_mstbl_no]
    self.house_bl_no =  params[:house_bl_no]
    self.second_bl_no =  params[:second_bl_no]
    self.volume_bl =  params[:volume_bl]
    self.volume_invoice =  params[:volume_invoice]
    self.warehouse_name =  params[:warehouse_name]
    self.kins =  params[:kins]
    self.cf_name =  params[:cf_name]
    
    self.ssline_id =  params[:ssline_id]
    self.broker_id =  params[:broker_id]
    self.depo_id =  params[:depo_id]
    
    self.departure_airport_code =  params[:departure_airport_code]
    self.departure_airport_name =  params[:departure_airport_name_]
    self.receipt_place_code =  params[:receipt_place_code]
    self.receipt_place_name =  params[:receipt_place_name]
    self.destination_airport_code =  params[:destination_airport_code]
    self.destination_airport_name =  params[:destination_airport_name]
    
    self.mawb_status =  params[:mawb_status]
    self.mawb_collect_id =  params[:mawb_collect_id]
    self.mawb_payable_id =  params[:mawb_payable_id]
    self.hawb_status =  params[:hawb_status]
    self.hawb_payable_id =  params[:hawb_payable_id]
    
    self.pieces_rcp =  params[:pieces_rcp]
    self.gross_weight =  params[:gross_weight]
    self.kglb =  params[:kglb]
    self.charge_weight =  params[:charge_weight]
    self.charge_rate =  params[:charge_rate]
    self.total =  params[:total]
    self.good_nature_quantity =  params[:good_nature_quantity]
    self.shipmark =  params[:shipmark]
    self.commodity =  params[:commodity]
    self.packaging_code =  params[:packaging_code]
    self.mawb_no =  params[:mawb_no]
    self.chargeable_weight =  params[:chargeable_weight]
    self.weight_hawb =  params[:weight_hawb]
    self.carriage_value =  params[:carriage_value]
    self.custome_value =  params[:custome_value]
    self.iata_id =  params[:iata_id]
    self.broker_id =  params[:broker_id]
    
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
  
end
