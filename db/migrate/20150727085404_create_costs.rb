class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string  :code
      t.string  :name
      t.decimal :amount,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :cbm,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :min_charge_idr,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :min_charge_usd,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :max_charge_idr,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :max_charge_usd,  :default => 0,  :precision => 14, :scale => 2
      t.integer :cost_type
      t.text :description
      t.timestamps
    end
  end
end
