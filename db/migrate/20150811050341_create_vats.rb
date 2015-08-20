class CreateVats < ActiveRecord::Migration
  def change
    create_table :vats do |t|
      t.string  :name
      t.decimal :value,  :default => 0,  :precision => 14, :scale => 2
      t.timestamps
    end
  end
end
