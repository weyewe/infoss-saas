class CreateContinents < ActiveRecord::Migration
  def change
    create_table :continents do |t|
      t.string  :code
      t.string  :name
      t.string  :abbrevation
      t.timestamps
    end
  end
end
