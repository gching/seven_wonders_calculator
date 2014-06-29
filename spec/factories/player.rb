FactoryGirl.define do
  factory :player do
    game_id Faker::Number.digit
    name  Faker::Name.name
    victories Faker::Number.digit
    coins Faker::Number.digit
    wonders Faker::Number.digit
    blues Faker::Number.digit
    yellows Faker::Number.digit
    purples Faker::Number.digit
    tablets Faker::Number.digit
    gears Faker::Number.digit
    compasses Faker::Number.digit
    leaders Faker::Number.digit
    blacks Faker::Number.digit
  end
end
