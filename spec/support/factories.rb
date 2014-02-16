FactoryGirl.define do

  factory :play do
    title 'Romeo and Juliet'
  end

  factory :act do
    title 'Act I'
    play
  end

  factory :speaker do
    name 'Romeo'
    play
  end

  factory :scene do
    title 'On a balcony'
    act
  end

end
