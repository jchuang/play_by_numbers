class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.integer :speaker_id, null: false
      t.integer :scene_id, null: false

      t.timestamps
    end
  end
end
