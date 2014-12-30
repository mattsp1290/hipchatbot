class CreateHooks < ActiveRecord::Migration
  def change
    create_table :hooks do |t|
      t.string :room
      t.string :url
      t.string :event

      t.timestamps
    end
  end
end
