class Speech < ActiveRecord::Base

  validates :speaker, presence: true
  validates :scene, presence: true

  belongs_to :speaker, inverse_of: :speeches
  belongs_to :scene, inverse_of: :speeches
  has_many :lines, inverse_of: :speech, dependent: :destroy

end
