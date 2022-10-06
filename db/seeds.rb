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
