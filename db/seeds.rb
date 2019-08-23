# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_list = ["Apparel", "Electronics", "Furniture", "Toys/Games", "Others"]
categories_list.each do |category|
  Category.create(category: category)
end

users_list = [
  ["khai", "000000000", "Anson Road", "khai@gmail.com", "123456"],
  ["herda", "111111111", "Tanjong Pagar", "herda@yahoo.com.sg", "654321"]
]
users_list.each do |name, phone, location, email, password|
  User.create(name: name, phone: phone, location: location, email: email, password: password)
end

items_list = [
  ["Blender", "k4rmwv9aujyvnbuww8g7", "Easy to use 3-speed blender!", "t", "reserved", "1", "2"],
  ["Car vacuum cleaner", "w5o5xlziondfu7xgckpl", "comes with 5m cord", "t", "Available", "1", "2"],
  ["Kids backpack", "o2gz56k1xdhtm5zgffys", "BUZZ LIGHTYEAR backpack", "t", "Available", "1", "5"],
  ["Casual runners", "rf89c5ieaautcaveifpw", "Ladies casual runners. Size US7.5", "t", "reserved", "2", "1"],
  ["off-shoulder dress", "o7nm58i05drilznb9lo7", "Medium size. Never used!", "f", "Available", "2", "1"]
]
items_list.each do |name, public_id, description, preloved, availability, user_id, category_id|
  Item.create(name: name, public_id: public_id, description: description, preloved: preloved, availability: availability, user_id: user_id, category_id: category_id)
end