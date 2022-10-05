# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'csv'

# Product.delete_all

# # 676.times do
# #   Product.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price,
# #                  stock_quantity: Faker::Number.number)
# # end
# csv_file = Rails.root.join('db/products.csv')
# csv_data = File.read(csv_file)

# products = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

# products.each do |_product|
#   # Create categories and products here.
#   category = Category.find_or_create_by(name: _product['category'])
#   next unless category && category.valid?

#   category.products.create(
#     title: _product['name'],
#     price: _product['price'],
#     description: _product['description'],
#     stock_quantity: _product['stock quantity'],
#     category: category
#   )
require 'csv'
require 'net/http'

Dish.delete_all
Category.delete_all

def load_categories
  csv_file = Rails.root.join('db/categories.csv')
  csv_data = File.read(csv_file)

  categories = CSV.parse(csv_data, encoding: 'utf-8')

  # categories.each do |_cat|
  categories.sample
end

# 4.times do
csv_file = Rails.root.join('db/categories.csv')
csv_data = File.read(csv_file)

categories = CSV.parse(csv_data, encoding: 'utf-8')

categories.each do |row|
  row.each do |r|
    puts r
    Category.create(
      meal_time: r
    )
  end
end
# end

# puts load_categories
# end

# category = Category.find_or_create_by(meal_time: categories['category'])
# next unless category && category.valid?
# end

200.times do
  uri = URI('https://www.themealdb.com/api/json/v1/1/random.php')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.path, { 'Content-Type' => 'application/json' })

  response = http.request(request)

  body = JSON.parse(response.body)['meals'][0]['strInstructions']

  Dish.create(
    name: Faker::Food.dish,
    recipe: body,
    category_id: rand(296..298)
  )
end
