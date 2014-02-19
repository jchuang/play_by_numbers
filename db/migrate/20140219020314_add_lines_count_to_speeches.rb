class AddLinesCountToSpeeches < ActiveRecord::Migration

  def up
    add_column :speeches, :lines_count, :integer, default: 0, null: false

    Speech.reset_column_information
    Speech.all.each do |speech|
      Speech.reset_counters(speech.id, :lines)
    end
  end

  def down
    remove_column :speeches, :lines_count
  end

end
