class CreateSalesInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :sales_invoice_details do |t|
      t.integer :sales_invoice_id
      t.string :code
      t.integer :sequence 
      t.integer :epl_detail_id 
      t.text :description 
      t.integer :type 
      t.boolean :coding_quantity , :default => false 
      t.decimal :quantity, :default => 0 , :default => 0,  :precision => 14, :scale => 2  
      t.decimal :per_qty, :default => 0 , :default => 0,  :precision => 14, :scale => 2  
      t.boolean :sign, :default => false 
      t.integer :exchange_id, :default => false 
      t.decimal :amount, :default => 0 , :default => 0,  :precision => 14, :scale => 2  
      t.decimal :percent_vat, :default => 0 , :default => 0,  :precision => 14, :scale => 2  
      t.decimal :amount_vat, :default => 0 , :default => 0,  :precision => 14, :scale => 2  
      t.integer :vat_id
      t.timestamps
    end
  end
end
