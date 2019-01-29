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

Admin.delete_all
5.times do |i|
	Admin.create!(
		email: Faker::Internet.unique.email,
		password: Faker::Internet.password(6)
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
