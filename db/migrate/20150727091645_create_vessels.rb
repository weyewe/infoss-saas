class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string  :name
      t.string  :abbrevation
      t.timestamps
    end
  end
end
