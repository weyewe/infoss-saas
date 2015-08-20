class CreateShipmentOrderServices < ActiveRecord::Migration
  def change
    create_table :shipment_order_services do |t|
      t.string :name
      t.timestamps
    end
  end
end
