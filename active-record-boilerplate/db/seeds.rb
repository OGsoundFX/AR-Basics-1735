# This is where you can create initial data for your app.
puts "destroying restaurants"
Restaurant.destroy_all

puts "creating restaurants"
# Restaurant.create(name: "Olivier's", address: "Berlin")
# Restaurant.create(name: "Nina's", address: "London")

# puts "Done!"
# puts "#{Restaurant.count} restaurants were created"

# seed with faker
# require "faker"

# 10.times do
#   Restaurant.create(name: Faker::Name.name, address: Faker::Address.full_address, rating: rand(1..10))
# end

# seed with api
require "json"
require "rest-client"

response = RestClient.get "https://api.github.com/users/lewagon/repos"
articles = JSON.parse(response)

p articles[0]["name"]
articles.first(10).each do |article|
  name = article["name"]
  address = article["html_url"]
  rating = rand(1..10)
  Restaurant.create(name: name, address: address, rating: rating)
end

