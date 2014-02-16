FactoryGirl.define do

  factory :play do
    title 'Romeo and Juliet'
  end

  factory :act do
    title 'Act I'
    play
  end

end
