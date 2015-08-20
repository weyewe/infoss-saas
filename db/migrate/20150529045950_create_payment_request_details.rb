class CreatePaymentRequestDetails < ActiveRecord::Migration
  def change
    create_table :payment_request_details do |t|
      t.integer :payment_request_id
      t.integer :epl_detail_id
      t.text :description
      t.integer :exchange_id
      t.decimal :amount , :default        => 0,  :precision => 14, :scale => 2
      t.string :code
      t.timestamps
    end
  end
end
