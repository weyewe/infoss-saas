class CreateCountryLocations < ActiveRecord::Migration
  def change
    create_table :country_locations do |t|
      t.string  :code
      t.string  :name
      t.string  :abbrevation
      t.integer :continent_id
      t.timestamps
    end
  end
end
