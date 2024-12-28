FactoryBot.define do
  factory :score do
    association :piece
    name { 'Violin Concerto in C major' }
    composer { Faker::Name.name }
    publisher { Faker::Name.name }
    instrument { 'violin' }
  end
end
