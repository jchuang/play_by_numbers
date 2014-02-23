# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'

document = Nokogiri::XML(File.open(Rails.root + 'db/data/julius_caesar.xml'))

play_title = document.xpath('/PLAY/TITLE').text
Play.find_or_create_by!(title: play_title)
play = Play.find_by(title: play_title)

speakers = document.xpath('//PERSONA')
speakers.each do |speaker|
  name = speaker.text

  if name == 'Young CATO'
    Speaker.find_or_create_by!(name: 'CATO', play_id: play.id)
  else
    Speaker.find_or_create_by!(name: name, play_id: play.id)
  end
end

Speech.delete_all
Line.delete_all

def create_lines(speech_node, speech)
  line_nodes = speech_node.xpath('./LINE')

  line_nodes.each do |line_node|
    line = Line.create!(line_text: line_node.text, speech_id: speech.id)
  end
end

def create_speech(speaker_node, speech_node, scene)
  speaker_name = speaker_node.text
  unless speaker_name == 'All'

    speaker = Speaker.find_by(name: speaker_name)
    speech = Speech.create!(speaker_id: speaker.id, scene_id: scene.id)

    create_lines(speech_node, speech)
  end
end

act_nodes = document.xpath('//ACT')
act_nodes.each do |act_node|

  act_title = act_node.xpath('./TITLE').text
  Act.find_or_create_by!(title: act_title, play_id: play.id)
  act = Act.find_by(title: act_title, play_id: play.id)

  scene_nodes = act_node.xpath('./SCENE')
  scene_nodes.each do |scene_node|

    scene_title = scene_node.xpath('./TITLE').text
    Scene.find_or_create_by!(title: scene_title, act_id: act.id)
    scene = Scene.find_by(title: scene_title, act_id: act.id)

    speech_nodes = scene_node.xpath('./SPEECH')
    speech_nodes.each do |speech_node|

      speaker_nodes = speech_node.xpath('./SPEAKER')
      if speaker_nodes.count > 1
        speaker_nodes.each { |speaker_node| create_speech(speaker_node, speech_node, scene) }

      else
        speaker_node = speaker_nodes.first
        create_speech(speaker_node, speech_node, scene)
      end
    end
  end
end
