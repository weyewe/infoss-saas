class CreateShipmentOrders < ActiveRecord::Migration
  def change
    create_table :shipment_orders do |t|
      t.string :shipment_no 
      t.integer  :job_number
      t.integer  :company_id
      t.integer  :sub_job_number
      t.integer  :job_id
      t.integer  :job_owner_id
      t.integer  :total_sub
      t.string  :si_reference
      t.datetime  :si_date
      t.string  :load_status
      t.string  :container_status
      t.string :shipment_status
      t.string  :freight_status
      t.integer  :service_no_id
      t.integer  :market_id
      t.integer  :market_company_id
      t.string  :job_status
      t.datetime  :goods_rec_date
      t.string  :conversion
      t.string  :quotaion_no
      t.integer  :agent_id
      t.string  :agent_name
      t.string  :agent_address
      t.integer  :delivery_id
      t.string  :delivery_name
      t.string  :delivery_address
      t.integer  :transhipment_id
      t.string  :transhipment_name
      t.string  :transhipment_address
      t.integer  :shipper_id
      t.string  :shipper_name
      t.string  :shipper_address
      t.integer  :consignee_id
      t.string  :consignee_name
      t.string  :consignee_address
      t.integer  :nparty_id
      t.string  :nparty_name
      t.string  :nparty_address
      t.string  :receipt_place_code
      t.string  :receipt_place_name
      t.string  :loading_port_code
      t.string  :loading_port_name
      t.string  :discharge_port_code
      t.string  :discharge_port_name
      t.string  :delivery_place_code
      t.string  :delivery_place_name
      t.string  :departure_airport_code
      t.string  :departure_airport_name
      t.string  :destination_airport_code
      t.string  :destination_airport_name
      t.text  :good_description
      t.string  :pieces_rcp
      t.decimal :gross_weight,  :default => 0,  :precision => 14, :scale => 2
      t.string :kglb
      t.decimal :charge_weight,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :charge_rate,  :default => 0,  :precision => 14, :scale => 2
      t.string :total
      t.string :commodity
      t.string :packaging_code
      t.string :good_nature_quantity
      t.string :shipmark
      t.string :chargeable_weight
      t.decimal :weight_hawb,  :default => 0,  :precision => 14, :scale => 2
      t.string :carriage_value
      t.string :custome_value
      t.datetime :etd
      t.datetime :eta
      t.string :obl_status
      t.integer :obl_collect_id 
      t.integer :obl_payable_id
      t.decimal :obl_amount,  :default => 0,  :precision => 14, :scale => 2
      t.string :obl_currency
      t.string :hbl_status
      t.integer :hbl_collect_id
      t.integer :hbl_payable_id
      t.string  :hbl_currency
      t.decimal :hbl_amount,  :default => 0,  :precision => 14, :scale => 2
      t.string :mawb_status
      t.integer :mawb_collect_id
      t.integer :mawb_payable_id
      t.string  :mawb_currency
      t.decimal :mawb_rate,  :default => 0,  :precision => 14, :scale => 2
      t.string :hawb_status
      t.integer :hawb_collect_id
      t.integer :hawb_payable_id
      t.string  :hawb_currency
      t.decimal :hawb_rate,  :default => 0,  :precision => 14, :scale => 2
      t.string :currency
      t.string :handling_info
      t.string :hawb_no
      t.string :mawb_no
      t.string :ocean_mstbl_no
      t.string :house_bl_no
      t.string :second_bl_no
      t.decimal :volume_bl,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :volume_invoice,  :default => 0,  :precision => 14, :scale => 2
      t.string :warehouse_name
      t.string :kins
      t.string :cf_name
      t.integer :ssline_id
      t.integer :iata_id
      t.integer :broker_id
      t.integer :depo_id
      t.string :vessel_flight
      t.string :truck
      t.boolean :job_closed , :default => false
      t.datetime :job_closed_on 
      t.boolean :is_confirmed , :default => false
      t.datetime :confirmed_at 
      t.timestamps
    end
  end
end
