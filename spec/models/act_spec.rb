require 'spec_helper'

describe Act do

  it { should validate_presence_of :title }
  it { should validate_presence_of :play }

  it 'should validate uniqueness of title for a given play' do
    FactoryGirl.create(:act)
    should validate_uniqueness_of(:title).scoped_to(:play_id)
  end

  it { should belong_to :play }
  it { should have_many(:scenes).dependent(:destroy) }

end
