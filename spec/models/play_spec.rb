require 'spec_helper'

describe Play do

  it { should validate_presence_of :title }

  it 'has a unique title' do
    FactoryGirl.create(:play)
    should validate_uniqueness_of(:title)
  end

  it { should have_many(:acts).dependent(:destroy) }

end
