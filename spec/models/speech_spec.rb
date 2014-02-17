require 'spec_helper'

describe Speech do

  it { should validate_presence_of :speaker }
  it { should validate_presence_of :scene }

  it { should belong_to :speaker }
  it { should belong_to :scene }

end
