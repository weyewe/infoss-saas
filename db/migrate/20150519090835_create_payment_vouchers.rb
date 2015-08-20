class CreatePaymentVouchers < ActiveRecord::Migration
  def change
    create_table :payment_vouchers do |t|
      t.string :code 
      t.integer :contact_id
      t.integer :cash_bank_id
      t.datetime :payment_date
      t.decimal :total_amount_idr , :default        => 0,  :precision => 14, :scale => 2 
      t.decimal :total_amount_usd , :default        => 0,  :precision => 14, :scale => 2 
      t.datetime :due_date 
      t.boolean :is_confirmed , :default => false
      t.datetime :confirmed_at 
      t.timestamps
    end
  end
end
