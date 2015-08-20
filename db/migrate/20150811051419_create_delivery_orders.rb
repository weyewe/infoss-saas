class CreateDeliveryOrders < ActiveRecord::Migration
  def change
    create_table :delivery_orders do |t|
      t.integer :shipment_order_id      
      t.text :to_name      
      t.text :attention      
      t.text :commodity      
      t.text :remarks      
      t.integer :printing
      t.datetime :printed_on
      t.timestamps
    end
  end
end
