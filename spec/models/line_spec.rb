require 'spec_helper'

describe Line do

  it { should validate_presence_of :line_text }
  it { should validate_presence_of :speech }

  it { should belong_to :speech }

end
