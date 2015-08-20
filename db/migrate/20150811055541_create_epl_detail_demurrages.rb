class CreateEplDetailDemurrages < ActiveRecord::Migration
  def change
    create_table :epl_detail_demurrages do |t|
      t.integer :epl_detail_id
      t.integer :company_id
      t.integer :customer_id
      t.integer :customer_type_id
      t.datetime :date_back_container
      t.integer :free_time
      t.integer :fase
      t.integer :total_container_20
      t.integer :total_container_40
      t.string  :disc_type
      t.decimal :disc_amount,  :default => 0,  :precision => 14, :scale => 2
      t.timestamps
    end
  end
end
