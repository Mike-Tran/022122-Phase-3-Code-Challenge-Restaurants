require 'pry'

# This will delete any existing rows from the Restaurant and Customer tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Restaurant/Customer data..."
Restaurant.destroy_all
Customer.destroy_all
Review.destroy_all

puts "Creating restaurants..."
r1 = Restaurant.create(name: "Karen's Lobster Shack", price: 1)
r2 = Restaurant.create(name: "Sanjay's Lobster Bistro", price: 24)
r3 = Restaurant.create(name: "Kiki's Lobster Palace", price: 3)

puts "Creating customers..."
c1 = Customer.create(first_name: "Emma", last_name: "Bunton")
c2 = Customer.create(first_name: "Geri", last_name: "Halliwell")
c3 = Customer.create(first_name: "Melanie", last_name: "Brown")
c4 = Customer.create(first_name: "Melanie", last_name: "Chisholm")
c5 = Customer.create(first_name: "Victoria", last_name: "Addams")

puts "Creating reviews..."
# ********************************************************************
# * TODO: create reviews! Remember, a review belongs to a restaurant *
# * and a review belongs to a customer.                              *
# ********************************************************************
# Create reviews Here
#run a loop 25 times
5.times do
	Review.create(
		star_rating: Faker::Number.number(digits: 1),
        restaurant_id: r1.id,
        customer_id: c1.id
	)
end
Review.create(
    star_rating: 99,
    restaurant_id: r3.id,
    customer_id: c1.id
)

5.times do
	Review.create(
		star_rating: Faker::Number.number(digits: 1),
        restaurant_id: r2.id,
        customer_id: c2.id
	)
end

5.times do
	Review.create(
		star_rating: Faker::Number.number(digits: 1),
        restaurant_id: r3.id,
        customer_id: c3.id
	)
end

# puts "Seeding done!"

# puts
# puts
# puts
# puts "################## TESTING ##################"
# puts
# puts
# puts "****************** CUSTOMER FULL NAME ******************"
# puts
# puts "Should be Emma Bunton: #{c1.full_name}"
# puts
# puts "Should be Geri Halliwell: #{c2.full_name}"
# puts
# puts "****************** FAVORITE RESTAURANT ******************"
# puts
# c1.restaurants.map do |r|
#     puts "NAME: #{r.name}"
# end
# puts "------------"
# puts "SHOULD BE Kiki's Lobster Palace: #{c1.favorite_restuarant.name}  **This is the object**==> #{c1.favorite_restuarant}"
# puts
# puts "Should be Sanjay's Lobster Bistro: #{Restaurant.fanciest.name} **This is the object**==> #{Restaurant.fanciest}"
# puts
# puts "****************** ALL_REVIEWS ******************"
# puts r1.all_reviews