# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 5.times do |i|
#   Category.create(category: "Category ##{i}")
# end

Category.create(category: "Apparels")
Category.create(category: "Electronics")
Category.create(category: "Furniture and fittings")
Category.create(category: "Toys and Games")
Category.create(category: "Others")

5.times do |i|

	Item.create(name: "Dress ##{i}", description: "A dress", public_id: "sz1pne0rmk2jsh5ti5hn", preloved: "True")
end