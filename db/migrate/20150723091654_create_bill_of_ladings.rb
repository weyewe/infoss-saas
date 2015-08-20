class CreateBillOfLadings < ActiveRecord::Migration
  def change
    create_table :bill_of_ladings do |t|
      
      t.integer  :shipment_order_id
      t.integer  :master_bl_id
      t.integer  :company_id
      t.string  :bl_number
      t.string  :no_of_bl
      t.datetime  :place_date_issue
      t.integer  :agent_id
      t.string  :agent_name
      t.string  :agent_address
      t.integer  :shipper_id
      t.string  :shipper_name
      t.string  :shipper_address
      t.integer  :consignee_id
      t.string  :consignee_name
      t.string  :consignee_address
      t.integer  :nparty_id
      t.string  :nparty_name
      t.string  :nparty_address
      t.datetime  :shipment_on_board
      t.string  :total_no_container
      t.decimal  :hawb_fee ,  :default => 0,  :precision => 14, :scale => 2
      t.string  :cargo_insurance
      t.string  :amount_insurance
      t.string  :freight_amount
      t.string  :freight_payable_at
      t.text  :description
      t.integer  :print_draft
      t.integer  :print_fixed
      t.datetime  :print_fixed_on
      t.datetime  :first_print_fixed_on
      t.timestamps
    end
  end
end
