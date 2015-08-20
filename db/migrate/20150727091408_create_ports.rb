class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string  :code
      t.string  :name
      t.string  :abbrevation
      t.integer :city_location_id  
      t.timestamps
    end
  end
end
