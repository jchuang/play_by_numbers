FactoryGirl.define do

  factory :play do
    title 'Romeo and Juliet'
  end

  factory :act do
    title 'Act I'
    play
  end

  factory :speaker do
    sequence(:name) { |n| "Speaker #{n}" }
    play
  end

  factory :scene do
    title 'On a balcony'
    act
  end

  factory :speech do
    speaker
    scene
  end

  factory :line do
    line_text 'hello world'
    speech
  end

end
