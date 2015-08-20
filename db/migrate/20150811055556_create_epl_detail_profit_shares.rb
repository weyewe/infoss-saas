class CreateEplDetailProfitShares < ActiveRecord::Migration
  def change
    create_table :epl_detail_profit_shares do |t|
      t.integer :epl_detail_id
      t.integer :company_id
      t.integer :customer_id
      t.integer :customer_type_id
      t.integer :sequence
      t.decimal :s_feet_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_feet_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_feet_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_feet_m3,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_rate_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_rate_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_rate_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :s_rate_m3,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_feet_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_feet_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_feet_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_feet_m3,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_rate_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_rate_40,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_rate_hq,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :b_rate_m3,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :percentage,  :default => 0,  :precision => 14, :scale => 2
      t.timestamps
    end
  end
end
