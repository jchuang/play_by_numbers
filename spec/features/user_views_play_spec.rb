require 'spec_helper'

feature 'user views play' do

  scenario 'only characters from correct play are displayed' do
    play1 = FactoryGirl.create(:play)
    play2 = FactoryGirl.create(:play, title: 'another play')

    act = FactoryGirl.create(:act, play: play1)
    scene = FactoryGirl.create(:scene, act: act)

    speaker1 = FactoryGirl.create(:speaker, play: play1)
    speaker2 = FactoryGirl.create(:speaker, play: play2)

    visit play_path(play1)
    expect(page).to have_content speaker1.name
    expect(page).to_not have_content speaker2.name
  end

end
