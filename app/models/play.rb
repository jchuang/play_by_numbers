class Play < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  has_many :acts, inverse_of: :play, dependent: :destroy
  has_many :speakers, inverse_of: :play, dependent: :destroy

end
