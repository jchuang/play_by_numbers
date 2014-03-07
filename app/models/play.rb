class Play < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  has_many :speakers, inverse_of: :play, dependent: :destroy
  has_many :acts, inverse_of: :play, dependent: :destroy
  has_many :scenes, through: :acts

  def self.import_from_xml(xml)

  end

end
