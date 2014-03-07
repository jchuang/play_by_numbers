# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'

document = Nokogiri::XML(File.open(Rails.root + 'db/data/julius_caesar.xml'))

def parse_name(text)
  if text == 'Young CATO'
    'CATO'
  else
    text
  end
end

play_title = document.xpath('/PLAY/TITLE').text
play = Play.find_or_create_by!(title: play_title)

speakers = document.xpath('//PERSONA')
speakers.each do |speaker|
  name = parse_name(speaker.text)
  Speaker.find_or_create_by!(name: name, play_id: play.id)
end

Speech.delete_all
Line.delete_all

# line_number = 0

def create_lines(speech_node, speech)
  line_nodes = speech_node.xpath('./LINE')

  line_nodes.each_with_index do |line_node, pos|
    line = Line.create!(line_text: line_node.text, speech_id: speech.id, position: pos)
  end
end

def create_speech(speaker_node, speech_node, scene, pos)
  speaker_name = speaker_node.text
  unless speaker_name == 'All'

    speaker = Speaker.find_by(name: speaker_name)
    speech = Speech.find_or_create_by!(speaker_id: speaker.id, scene_id: scene.id, position: pos)

    create_lines(speech_node, speech)
  end
end

act_nodes = document.xpath('//ACT')
act_nodes.each do |act_node|

  act_title = act_node.xpath('./TITLE').text
  act = Act.find_or_create_by!(title: act_title, play_id: play.id)

  scene_nodes = act_node.xpath('./SCENE')
  scene_nodes.each do |scene_node|

    scene_title = scene_node.xpath('./TITLE').text
    scene = Scene.find_or_create_by!(title: scene_title, act_id: act.id)

    speech_nodes = scene_node.xpath('./SPEECH')
    speech_nodes.each do |speech_node|

      speaker_nodes = speech_node.xpath('./SPEAKER')
      speaker_nodes.each_with_index { |speaker_node, pos| create_speech(speaker_node, speech_node, scene, pos) }
    end
  end
end
