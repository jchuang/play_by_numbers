class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :title, null: false
      t.integer :play_id, null: false

      t.timestamps
      t.index [:title, :play_id], unique: true
    end
  end
end
