class CreateMigrations < ActiveRecord::Migration
  def change
    create_table :migrations do |t|
      t.string :number
      t.string :owner

      t.timestamps
    end
  end
end
