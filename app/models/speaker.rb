class Speaker < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { scope: :play_id }
  validates :play, presence: true

  belongs_to :play, inverse_of: :acts
  has_many :speeches, inverse_of: :speaker, dependent: :destroy
  has_many :scenes, -> { distinct }, through: :speeches
  has_many :lines, through: :speeches

  def num_lines
    @num_lines ||= lines.count
  end

  def longest_speech_lines
    @speech ||= longest_speech
    @speech.nil? ? 0 : @speech.lines_count
  end

  def num_scenes
    @num_scenes ||= scenes.count
  end

  def self.sort_speakers(params)
    speakers = Speaker.where(play_id: params[:id])
    if params[:sort] == 'num_lines'
      speakers.sort_by { |speaker| -speaker.num_lines }
    elsif params[:sort] == 'longest_speech_lines'
      speakers.sort_by { |speaker| -speaker.longest_speech_lines }
    elsif params[:sort] == 'num_scenes'
      speakers.sort_by { |speaker| -speaker.num_scenes }
    else
      speakers
    end
  end

  private

  def longest_speech
    if speeches.empty?
      nil
    else
      speeches.order(lines_count: :desc).limit(1).first
    end
  end

end
