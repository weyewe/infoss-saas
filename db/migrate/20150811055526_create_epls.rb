class CreateEpls < ActiveRecord::Migration
  def change
    create_table :epls do |t|
      t.integer :epl_no
      t.integer :shipment_order_id      
      t.integer :company_id
      t.decimal  :rate,  :default => 0,  :precision => 14, :scale => 2
      t.datetime  :ex_rate_date
      t.decimal  :total_income_idr,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :total_income_usd,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :total_cost_idr,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :total_cost_usd, :default => 0,  :precision => 14, :scale => 2
      t.integer  :time_close_epl
      t.integer  :close_epl_on
      t.integer  :period
      t.integer  :year_period
      t.integer  :printing
      t.datetime  :printed_on
      t.integer :ex_rate_id     
      t.boolean :is_confirmed , :default => false
      t.datetime :confirmed_at 
      t.timestamps
    end
  end
end
