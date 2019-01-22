FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    priority { Faker::Number.number(1) }
  end
end