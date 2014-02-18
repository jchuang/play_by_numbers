class AddIndexesOnForeignKeys < ActiveRecord::Migration
  def change

    add_index :acts, :play_id
    add_index :scenes, :act_id
    add_index :speakers, :play_id
    add_index :speeches, :speaker_id
    add_index :speeches, :scene_id
    add_index :lines, :speech_id

  end
end
