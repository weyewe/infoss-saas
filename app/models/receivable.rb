class Receivable < ActiveRecord::Base
  belongs_to :receipt_voucher
  belongs_to :exchange
  belongs_to :contact
  
  def self.active_objects
    return self
  end
  
  def self.create_object (params)
    new_object = self.new
    new_object.source_class = params[:source_class]
    new_object.source_id = params[:source_id]
    new_object.contact_id = params[:contact_id]
    new_object.source_code = params[:source_code]
    new_object.description = params[:description]
    new_object.shipment_order_id = params[:shipment_order_id]
    new_object.amount =  BigDecimal( params[:amount_idr] || '0')
    new_object.remaining_amount =  BigDecimal( params[:amount_idr] || '0')
    new_object.exchange_id = params[:exchange_id]
    new_object.exchange_rate_amount =  BigDecimal( params[:exchange_rate_amount] || '0')
    new_object.due_date = params[:due_date]
    new_object.save
    return new_object
  end
  
  def update_object (params)
    self.source_class = params[:source_class]
    self.source_id = params[:source_id]
    self.source_code = params[:source_code]
    self.amount = params[:amount]
    self.remaining_amount = params[:remaining_amount]
    self.save
    return self
  end
  
  def update_remaining_amount_idr (amount)
    self.remaining_amount_idr += amount
    self.save
    return self
  end
  
  def update_remaining_amount_usd (amount)
    self.remaining_amount_usd += amount
    self.save
    return self
  end
  
  def set_completed_receivable
    if self.remaining_amount_usd == 0 and self.remaining_amount_idr == 0
      self.is_completed = true
    end
    if not self.remaining_amount_usd == 0 or not self.remaining_amount_idr == 0 
      self.is_completed = false
    end
    return self
  end
  
  
  def delete_object
    self.destroy
    return self
  end
  
end
