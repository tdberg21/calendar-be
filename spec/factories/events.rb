FactoryBot.define do
  factory :event do
    title { Faker::Book.title }
    date { Faker::Date.forward(23) }
    time { '08:00' }
    category { Faker::Color.color_name }
    comments { Faker::PrincessBride.quote }
  end
end