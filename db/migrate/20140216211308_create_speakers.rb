class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name, null: false
      t.integer :play_id, null: false

      t.timestamps
      t.index [:name, :play_id], unique: true
    end
  end
end
