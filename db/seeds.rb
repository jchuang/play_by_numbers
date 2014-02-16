# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'pry'

@doc = Nokogiri::XML(File.open(Rails.root + 'db/data/julius_caesar.xml'))

play_title = @doc.xpath('/PLAY/TITLE').text
Play.find_or_create_by!(title: play_title)
play = Play.find_by(title: play_title)

acts = @doc.xpath('//ACT/TITLE')
acts.each do |act|
  act_title = act.text
  Act.find_or_create_by!(title: act_title, play_id: play.id)
end

speakers = @doc.xpath('//PERSONA')
speakers.each do |speaker|
  name = speaker.text
  Speaker.find_or_create_by!(name: name, play_id: play.id)
end
