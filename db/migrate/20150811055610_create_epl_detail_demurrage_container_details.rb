class CreateEplDetailDemurrageContainerDetails < ActiveRecord::Migration
  def change
    create_table :epl_detail_demurrage_container_details do |t|
      t.integer :epl_detail_demurrage_container_id
      t.integer :company_id
      t.integer :day_container
      t.text :description
      t.decimal :amount_container_20,  :default => 0,  :precision => 14, :scale => 2
      t.decimal :amount_container_40,  :default => 0,  :precision => 14, :scale => 2
      t.timestamps
    end
  end
end
