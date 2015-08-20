class CreateShipmentInstructions < ActiveRecord::Migration
  def change
    create_table :shipment_instructions do |t|
      t.integer :shipment_order_id
      t.integer :company_id
      t.string  :si_reference
      t.string  :attention
      t.integer :shipper_id
      t.string  :shipper_name
      t.text  :shipper_address
      t.integer :consignee_id
      t.string  :consignee_name
      t.text  :consignee_address
      t.integer  :n_party_id
      t.string  :n_party_name
      t.text  :n_party_address
      t.text  :good_description
      t.integer  :updated
      t.text  :special_instruction
      t.string  :original_bl
      t.string  :freight_agreed
      t.integer  :collect_at
      t.string  :collect_name
      t.text  :collect_address
      t.integer  :printing
      t.integer  :printed_on
      t.string  :pieces_rcp
      t.decimal  :gross_weight,  :default => 0,  :precision => 14, :scale => 2
      t.string  :kglb
      t.decimal  :charge_weight,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :charge_rate,  :default => 0,  :precision => 14, :scale => 2
      t.string  :total
      t.string  :good_nature_quantity
      t.timestamps
    end
  end
end
