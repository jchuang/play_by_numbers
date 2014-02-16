require 'spec_helper'

describe Scene do

  it { should validate_presence_of :title }
  it { should validate_presence_of :act }

  it 'should validate uniqueness of title for a given act' do
    FactoryGirl.create(:scene)
    should validate_uniqueness_of(:title).scoped_to(:act_id)
  end

  it { should belong_to :act }

end
