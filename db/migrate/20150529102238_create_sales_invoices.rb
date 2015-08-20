class CreateSalesInvoices < ActiveRecord::Migration
  def change
    create_table :sales_invoices do |t|
      t.integer :shipment_order_id
      t.text    :description
      t.string  :code
      t.string  :nomor_surat
      t.integer :contact_id
      t.string  :contact_name
      t.text    :contact_address
      t.integer :bill_id
      t.string  :bill_name
      t.text    :bill_address
      t.integer :exchange_rate_id
      t.decimal :exchange_rate_amount, :default => 0,  :precision => 18, :scale => 11
      t.decimal :total_amount_usd , :default        => 0,  :precision => 14, :scale => 2
      t.decimal :total_vat_usd , :default        => 0,  :precision => 14, :scale => 2
      t.decimal :total_amount_idr , :default        => 0,  :precision => 14, :scale => 2
      t.decimal :total_vat_idr , :default        => 0,  :precision => 14, :scale => 2
      t.boolean  :is_confirmed , :default => false
      t.datetime :confirmed_at
      t.datetime :invoice_date
      t.datetime :due_date
      t.timestamps
    end
  end
end
