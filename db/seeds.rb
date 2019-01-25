# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Edition.delete_all
Edition.create! id: 1, name: "Edition 1"
Card.delete_all
Card.create! id: 1, name: "test 1", original_price: 0.49, active: true, edition_id: 1
Card.create! id: 2, name: "test 2", original_price: 0.29, active: true, edition_id: 1
Card.create! id: 3, name: "test 3", original_price: 1.99, active: true, edition_id: 1

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
