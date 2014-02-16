class Scene < ActiveRecord::Base

  validates :title, presence: true, uniqueness: { scope: :act_id }
  validates :act, presence: true

  belongs_to :act, inverse_of: :scenes

end
