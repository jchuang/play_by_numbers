class Act < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: :play_id }
  validates :play, presence: true

  belongs_to :play, inverse_of: :acts
  has_many :scenes, inverse_of: :act, dependent: :destroy

end
