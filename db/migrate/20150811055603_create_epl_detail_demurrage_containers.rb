class CreateEplDetailDemurrageContainers < ActiveRecord::Migration
  def change
    create_table :epl_detail_demurrage_containers do |t|
      t.integer :epl_detail_demurrage_id
      t.integer :company_id
      t.string  :container_no
      t.timestamps
    end
  end
end
