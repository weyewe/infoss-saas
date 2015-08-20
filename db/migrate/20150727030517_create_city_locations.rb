class CreateCityLocations < ActiveRecord::Migration
  def change
    create_table :city_locations do |t|
      t.string  :code
      t.string  :name
      t.string  :abbrevation
      t.integer :country_location_id  
      t.timestamps
    end
  end
end
