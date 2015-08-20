class CreateShipmentOrderRoutings < ActiveRecord::Migration
  def change
    create_table :shipment_order_routings do |t|
      t.integer :shipment_order_id
      t.integer :company_id
      t.integer :vessel_id
      t.string  :vessel_name
      t.string  :voyage
      t.integer :city_location_id
      t.integer :port_id
      t.integer :flight_id
      t.string  :flight_no
      t.integer :airport_from_id
      t.integer :airport_to_id
      t.datetime  :etd
      t.string  :vessel_type
      t.timestamps
    end
  end
end
