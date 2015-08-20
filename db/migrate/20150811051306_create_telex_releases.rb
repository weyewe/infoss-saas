class CreateTelexReleases < ActiveRecord::Migration
  def change
    create_table :telex_releases do |t|
      t.integer :shipment_order_id
      t.integer :company_id
      t.string :original
      t.string :sea_way_bill
      t.integer :printing
      t.datetime :printed_on
      t.timestamps
    end
  end
end
