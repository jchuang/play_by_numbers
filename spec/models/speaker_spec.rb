require 'spec_helper'

describe Speaker do

  it { should validate_presence_of :name }
  it { should validate_presence_of :play }

  it 'should validate uniqueness of name for a given play' do
    FactoryGirl.create(:speaker)
    should validate_uniqueness_of(:name).scoped_to(:play_id)
  end

  it { should belong_to :play }
  it { should have_many(:speeches).dependent(:destroy) }
  it { should have_many(:scenes).through(:speeches) }

end
