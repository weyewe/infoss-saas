class CreatePaymentVoucherDetails < ActiveRecord::Migration
  def change
    create_table :payment_voucher_details do |t|
      t.integer :payment_voucher_id
      t.decimal :amount , :default        => 0,  :precision => 14, :scale => 2 
      t.integer :payable_id
      t.text :description
      t.timestamps
    end
  end
end
