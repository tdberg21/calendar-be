5.times do
  Event.create({
    title: Faker::Book.title,
    date: '02/01/2019',
    time: '08:00',
    public: false,
    category: Faker::Color.color_name,
    comments: Faker::PrincessBride.quote
  })
end