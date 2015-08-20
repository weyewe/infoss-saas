class EplDetail < ActiveRecord::Base
  validate :valid_epl
  belongs_to :epl
  
  def self.active_objects
    self
  end
  
  def valid_epl
    return if  epl_id.nil?
    epl = Epl.find_by_id epl_id
    if epl.nil? 
      self.errors.add(:epl_id, "Harus ada epl id")
      return self 
    end
  end 
  
  def self.create_object(params)
    new_object = self.new
    epl = Epl.find_by_id(params[:epl_id])
    if not epl.nil?
      if epl.is_confirmed?
        new_object.errors.add(:generic_errors, "Sudah di konfirmasi")
        return new_object 
      end
    end
    new_object.epl_id = params[:epl_id]
    new_object.is_income = params[:is_income]
    new_object.contact_id = params[:contact_id]
    new_object.account_id = params[:account_id]
    new_object.description = params[:description]
    new_object.coding_quantity = params[:coding_quantity]
    new_object.type = params[:type]
    new_object.quantity = params[:quantity]
    new_object.per_qty = params[:per_qty]
    new_object.exchange_id = params[:exchange_id]
    new_object.amount_usd = params[:amount_usd]
    new_object.amount_idr = params[:amount_idr]
    new_object.sign = params[:sign]
 
    if new_object.save
      new_object.calculateTotalAmount
    end
    return new_object
  end
  
  def update_object(params)
    if self.epl.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.epl_id = params[:epl_id]
    self.is_income = params[:is_income]
    self.contact_id = params[:contact_id]
    self.account_id = params[:account_id]
    self.description = params[:description]
    self.coding_quantity = params[:coding_quantity]
    self.type = params[:type]
    self.quantity = params[:quantity]
    self.per_qty = params[:per_qty]
    self.exchange_id = params[:exchange_id]
    self.amount_usd = params[:amount_usd]
    self.amount_idr = params[:amount_idr]
    self.sign = params[:sign]
 
    if self.save
      self.calculateTotalAmount
    end
    return self
  end
  
  def delete_object
    if self.epl.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.destroy
    return self
  end
  
  def calculateTotalAmount
    total_cost_idr = 0
    total_cost_usd = 0
    total_income_idr = 0
    total_income_usd = 0
    EplDetail.where(:epl_id =>epl_id).each do |epld|
      if epld.is_income == true
        total_cost_idr += epld.amount_idr
        total_cost_usd += epld.amount_usd
        else
        total_income_idr += epld.amount_idr
        total_income_usd += epld.amount_usd
      end
    end
    epl = Epl.find_by_id(epl_id)
    epl.update_total_cost_idr(total_cost_idr)
    epl.update_total_cost_usd(total_cost_usd)
    epl.update_total_income_idr(total_income_idr)
    epl.update_total_income_usd(total_income_usd)
  end
  
  
end
