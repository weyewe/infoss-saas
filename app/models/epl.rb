class Epl < ActiveRecord::Base
  belongs_to :shipment_order
  validates_presence_of :shipment_order_id 
  has_many :epl_details
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
    if new_object.save
    end
    return new_object
  end
  
  def update_object(params)
    self.shipment_order_id = params[:shipment_order_id]
    self.company_id = params[:company_id]
    if self.save
    end
    return self
  end
  
  def delete_object
    self.destroy
    return self
  end
  
  def confirm_object(params)
    if self.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    if self.epl_details.count == 0
      self.errors.add(:generic_errors, "Tidak memiliki detail")
      return self 
    end 
    self.is_confirmed = true
    self.confirmed_at = params[:confirmed_at]
    if self.save
      self.confirm_detail
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
      self.unconfirm_detail
    end
    return self
  end
    
  def update_total_income_idr(total_income_idr)
    self.total_income_idr = total_income_idr
    self.save
  end 
  
  def update_total_income_usd(total_income_usd)
    self.total_income_idr = total_income_usd
    self.save
  end 
  
  def update_total_cost_idr(total_cost_idr)
    self.total_cost_idr = total_cost_idr
    self.save
  end 
  
  def update_total_cost_usd(total_cost_usd)
    self.total_cost_idr = total_cost_usd
    self.save
  end 
  
    
end
