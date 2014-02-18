class Speaker < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { scope: :play_id }
  validates :play, presence: true

  belongs_to :play, inverse_of: :acts
  has_many :speeches, inverse_of: :speaker, dependent: :destroy
  has_many :scenes, -> { distinct }, through: :speeches
  has_many :lines, through: :speeches

  def num_lines
    lines.count
  end

  def longest_speech_lines
    'longest_speech_lines'
  end

  def num_scenes
    scenes.count
  end

  # This should be handled elsewhere.  A play knows its total number of scenes.
  # Rails is using a cached value for num_scenes.
  def percent_scenes
    ((num_scenes * 100.0) / 18).round
  end

end
