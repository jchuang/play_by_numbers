class Speaker < ActiveRecord::Base

  validates :name, presence: true, uniqueness: { scope: :play_id }
  validates :play, presence: true

  belongs_to :play, inverse_of: :acts

end
