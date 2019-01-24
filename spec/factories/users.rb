FactoryBot.define do
  factory :user do
    name { Faker::Seinfeld.character }
    email { 'foo@bar.com' }
    password { 'foobar' }
  end
end