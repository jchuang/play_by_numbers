class Speaker < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { scope: :play_id }
  validates :play, presence: true

  belongs_to :play, inverse_of: :acts
  has_many :speeches, inverse_of: :speaker, dependent: :destroy
  has_many :scenes, -> { distinct }, through: :speeches
  has_many :lines, through: :speeches

end
