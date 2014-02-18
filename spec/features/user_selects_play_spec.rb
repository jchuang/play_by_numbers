require 'spec_helper'

feature 'user selects play' do

  scenario 'when one play is available' do
    play = FactoryGirl.create(:play)
    visit plays_path
    expect(page).to have_content play.title
  end

end
