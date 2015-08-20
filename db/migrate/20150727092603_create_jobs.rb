class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string  :code
      t.string  :name
      t.timestamps
    end
  end
end
