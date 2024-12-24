FactoryBot.define do
  factory :piece do
    name { 'Violin Concerto in C major' }
    composer { Faker::Name.name }
    composition_year { '1800' }
    form { 'symphony' }
    key { 'C major' }
  end
end
