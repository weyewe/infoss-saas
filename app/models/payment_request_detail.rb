class PaymentRequestDetail < ActiveRecord::Base
  
  validate :valid_payment_request
  belongs_to :payment_request
  belongs_to :epl_detail
  
  def self.active_objects
    self
  end
  
  
  def valid_payment_request
    return if  payment_request_id.nil?
    po = PaymentRequest.find_by_id payment_request_id
    if po.nil? 
      self.errors.add(:payment_request_id, "Harus ada Payment RequestId")
      return self 
    end
  end 
    
  def self.create_object(params)
    new_object = self.new
    payment_request = PaymentRequest.find_by_id(params[:payment_request_id])
    if not payment_request.nil?
      if payment_request.is_confirmed?
        new_object.errors.add(:generic_errors, "Sudah di konfirmasi")
        return new_object 
      end
    end
    
    new_object.payment_request_id = params[:payment_request_id]
    new_object.epl_detail_id = params[:epl_detail_id]
    
    new_object.description = params[:description]
    new_object.amount = BigDecimal( params[:amount] || '0')
    new_object.exchange_id = params[:exchange_id]
    
    if new_object.save
      new_object.code = "PRD-" + new_object.id.to_s  
      new_object.save
      new_object.calculateTotalAmount
    end
    return new_object
  end
  
  def update_object(params)
    if self.payment_request.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.epl_detail_id = params[:account_id]
    self.description = params[:description]
    self.epl_detail_id = params[:epl_detail_id]
    self.amount = BigDecimal( params[:amount] || '0')
    self.exchange_id = params[:exchange_id]
    
    if self.save
      self.exchange_id = self.epl_detail.exchange_id
      self.calculateTotalAmount
    end
    return self
  end
  
  def delete_object
    if self.payment_request.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.destroy
    self.calculateTotalAmount
    return self
  end
  
  
  def calculateTotalAmount
    total_amount_idr = 0
    total_amount_usd = 0
    PaymentRequestDetail.where(:payment_request_id =>payment_request_id).each do |prd|
      if prd.exchange_id == CURRENCY[:idr]
        total_amount_idr += prd.amount
      else
        total_amount_idr += prd.amount
      end
    end
    payment_request = PaymentRequest.find_by_id(payment_request_id)
    payment_request.update_total_amount_idr(total_amount_idr)
    payment_request.update_total_amount_usd(total_amount_usd)
  end
end
