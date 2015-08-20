class CreateEplDetailHandlings < ActiveRecord::Migration
  def change
    create_table :epl_detail_handlings do |t|
      t.integer :epl_detail_id
      t.integer :company_id
      t.integer :customer_id
      t.integer :customer_type_id
      t.integer :sequence
      t.decimal :feet_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :feet_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :feet_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :feet_m3,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :rate_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :rate_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :rate_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :rate_m3,  :default => 0,  :precision => 14, :scale => 2
      t.timestamps
    end
  end
end
