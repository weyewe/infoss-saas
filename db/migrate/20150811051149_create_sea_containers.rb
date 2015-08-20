class CreateSeaContainers < ActiveRecord::Migration
  def change
    create_table :sea_containers do |t|
      t.integer :shipment_order_id
      t.integer :company_id
      t.string :container_no
      t.string :seal_no
      t.integer :size
      t.integer :type
      t.decimal  :gross_weight,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :net_weight,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :cbm,  :default => 0,  :precision => 14, :scale => 2
      t.boolean  :part_of,  :default => false
      t.text :commodity
      t.decimal  :no_of_pieces,  :default => 0,  :precision => 14, :scale => 2
      t.string :packaging_code
      t.timestamps
    end
  end
end
