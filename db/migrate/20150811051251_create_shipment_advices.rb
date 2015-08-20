class CreateShipmentAdvices < ActiveRecord::Migration
  def change
    create_table :shipment_advices do |t|
      t.integer :shipment_order_id
      t.integer :company_id
      t.string  :reference
      t.string  :remarks
      t.integer :print_to_agent
      t.datetime  :print_to_agent_on
      t.integer :print_to_delivery
      t.datetime  :print_to_delivery_on
      t.timestamps
    end
  end
end
