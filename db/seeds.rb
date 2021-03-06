# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Admin.delete_all
Admin.create!(
  email: 'admin@test.com',
  password: "password"
)
5.times do |i|
  Admin.create!(
    email: Faker::Internet.unique.email,
    password: "password"
  )
  p "admin #{i} : créé"
end

Edition.delete_all
3.times do |i|
  Edition.create!(
    name: Faker::ElderScrolls.unique.region,
    release_date: Faker::Date.forward(90)
  )
  p "edition #{i} : créée"
end

OrderItem.delete_all
Order.delete_all

Item.delete_all
25.times do |i|
  # HTTP request for random Magic images
  puts "starting HTTP request for random image"
  response = open("https://api.scryfall.com/cards/random").read
  card = JSON.parse(response)
  sleep 0.05
  puts 'HTTP request done'

  Item.create!(
    name: card.dig('name'),
    description: card.dig('oracle_text'),
    image_url: card.dig('image_uris', 'normal'),
    original_price: card.dig('usd') || Faker::Number.between(1, 5),
    discounted_percentage: 0
  )
  p "item #{i} : créé"
end

User.delete_all
user = User.new(
  email: 'user@test.com',
  password: "password"
)
user.skip_confirmation!
user.save
10.times do |i|
  user = User.new(
    email: Faker::Internet.unique.email,
    password: "password"
  )
  user.skip_confirmation!
  user.save
  p "user #{i} : créé"
end

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "En cours"
OrderStatus.create! id: 2, name: "Confirmé"
OrderStatus.create! id: 3, name: "Envoyé"
OrderStatus.create! id: 4, name: "Annulé"

10.times do |i|
  Order.create!(
    subtotal: Faker::Number.between(5, 100),
    tax: Faker::Number.between(1, 5),
    shipping: Faker::Number.between(1, 5),
    total: Faker::Number.between(50, 130),
    user: User.all.sample
  )
  puts "seeded Order #{i}"
end
