class CreateEplDetails < ActiveRecord::Migration
  def change
    create_table :epl_details do |t|
      t.integer :epl_id
      t.integer :company_id
      t.integer :sequence
      t.boolean :is_income , :default => false
      t.integer :contact_id
      t.integer :contact_type_id
      t.integer :account_id
      t.text :description
      t.boolean :coding_quantity , :default => false
      t.integer :type
      t.decimal  :quantity,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :per_qty,  :default => 0,  :precision => 14, :scale => 2
      t.integer :amount_crr
      t.decimal  :amount_usd,  :default => 0,  :precision => 14, :scale => 2
      t.decimal  :amount_idr,  :default => 0,  :precision => 14, :scale => 2
      t.boolean :sign , :default => false
      t.boolean :data_from , :default => false
      t.integer :memo_no
      t.boolean :status_memo , :default => false
      t.datetime  :created_memo_on      
      t.boolean :paid_pr , :default => false
      t.boolean :is_split_in_cost , :default => false
      t.timestamps
    end
  end
end
