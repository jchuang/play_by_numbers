class Line < ActiveRecord::Base

  validates :line_text, presence: true
  validates :speech, presence: true

  belongs_to :speech, inverse_of: :lines, counter_cache: true

end
