class SalesInvoiceDetail < ActiveRecord::Base
  
    
  validate :valid_sales_invoice
  belongs_to :sales_invoice
  
  def self.active_objects
    self
  end
  
  def valid_sales_invoice
    return if  sales_invoice_id.nil?
    po = SalesInvoice.find_by_id sales_invoice_id
    if po.nil? 
      self.errors.add(:sales_invoice_id, "Harus ada SalesInvoice_id")
      return self 
    end
  end 
    
  def self.create_object(params)
    new_object = self.new
    sales_invoice = SalesInvoice.find_by_id(params[:sales_invoice_id])
    if not sales_invoice.nil?
      if sales_invoice.is_confirmed?
        new_object.errors.add(:generic_errors, "Sudah di konfirmasi")
        return new_object 
      end
    end
    
    
    new_object.sales_invoice_id = params[:sales_invoice_id]
    new_object.epl_detail_id = params[:epl_detail_id]
    new_object.description = params[:description]
    new_object.amount_idr = BigDecimal( params[:amount_idr] || '0')
    new_object.amount_usd = BigDecimal( params[:amount_usd] || '0')
    
    if new_object.save
      new_object.code = "SID-" + new_object.id.to_s  
      new_object.save
      new_object.calculateTotalAmount
    end
    return new_object
  end
  
  def update_object(params)
    if self.sales_invoice.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.delivery_order_detail_id = params[:item_id]
    self.amount = BigDecimal( params[:amount] || '0')
    if self.save
      self.price = (new_object.delivery_order_detail.purchase_order_detail.price * self.amount).round(2)
      self.calculateTotalAmount
    end
    return self
  end
  
  def delete_object
    if self.sales_invoice.is_confirmed?
      self.errors.add(:generic_errors, "Sudah di konfirmasi")
      return self 
    end
    self.destroy
    self.calculateTotalAmount
    return self
  end
  
  
  def calculateTotalAmount
    amount = 0
    SalesInvoiceDetail.where(:sales_invoice_id =>sales_invoice_id).each do |sid|
      amount += sid.price
    end
    sales_invoice = SalesInvoice.find_by_id(sales_invoice_id)
    discount = sales_invoice.discount / 100 * amount
    taxable_amount = amount - discount
    tax = sales_invoice.tax / 100 * taxable_amount
    sales_invoice.dpp = taxable_amount
    sales_invoice.amount_receivable = taxable_amount + tax 
    sales_invoice.save
    # SalesInvoice.find_by_id(sales_invoice_id).update_amount_receivable(amount)
  end
  
end
  
