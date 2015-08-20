class CreateTransactionData < ActiveRecord::Migration
  def change
    create_table :transaction_data do |t|
      t.integer :transaction_source_id 
      t.string :transaction_source_type 

      t.datetime :transaction_datetime 
      t.text :description 

      t.decimal :amount, :default        => 0,  :precision => 14, :scale => 2

      t.boolean :is_confirmed  
      
      t.integer :code 
      t.boolean :is_contra_transaction, :default => false 
      t.timestamps
    end
  end
end
