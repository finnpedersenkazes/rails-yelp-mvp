# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         "Epicure au Bristol",
    address:      "112 rue du Fg St-Honoré 75008 Paris",
    category:     ["chinese", "italian", "japanese", "french", "belgian"].sample
  },
  {
    name:         "La truffière",
    address:      "4 rue Blainville 75005 Paris",
    category:     ["chinese", "italian", "japanese", "french", "belgian"].sample
  },
  {
    name:         "Le pré catelan",
    address:      "route de Suresnes 75016 Paris",
    category:     ["chinese", "italian", "japanese", "french", "belgian"].sample
  }
]
Restaurant.create!(restaurants_attributes)

10.times do
  restaurant = Restaurant.first
  review = Review.new(
    content: Faker::Hacker.say_something_smart,
    rating: (0..5).to_a.sample,
    restaurant: restaurant
  )
  review.save!
end


10.times do
  restaurant = Restaurant.new(
      name: 'The ' + Faker::Food.ingredient + ' ' + Faker::Hipster.word,
      address: Faker::Address.street_address + ', ' + Faker::Address.city + ', ' + Faker::Address.country,
      phone_number: Faker::PhoneNumber.phone_number,
      category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )

  (1..10).to_a.sample.times do
    review = Review.new(
      content: Faker::Hacker.say_something_smart,
      rating: (0..5).to_a.sample,
      restaurant: restaurant
    )
    review.save!
  end
end

puts 'Finished!'
