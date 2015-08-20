 class CreatePaymentRequests < ActiveRecord::Migration
  def change
    create_table :payment_requests do |t|     
      t.integer :shipment_order_id
      t.integer :contact_id
      t.integer :company_id
      t.string :reference
      t.string :pr_no
      t.datetime :request_date
      t.string :code
      t.text :description 
      t.decimal :total_amount_usd , :default        => 0,  :precision => 14, :scale => 2
      t.decimal :total_amount_idr , :default        => 0,  :precision => 14, :scale => 2
      t.decimal :exchange_rate_amount , :default        => 0,  :precision => 18, :scale => 11
      t.datetime :due_date
      t.integer :exchange_rate_id
      t.boolean :is_confirmed , :default => false
      t.datetime :confirmed_at
      t.timestamps
    end
  end
end
