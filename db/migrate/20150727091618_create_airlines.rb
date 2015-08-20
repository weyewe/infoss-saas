class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string  :name
      t.string  :abbrevation
      t.timestamps
    end
  end
end
