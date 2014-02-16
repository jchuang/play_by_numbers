class Act < ActiveRecord::Base

  validates :title, presence: true
  validates :play, presence: true
  validates :title, uniqueness: { scope: :play_id }

  belongs_to :play, inverse_of: :acts

end
