# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Selection.destroy_all
Cart.destroy_all
Photo.destroy_all
User.destroy_all

ActiveRecord::Base.connection.execute("ALTER SEQUENCE selections_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE carts_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE photos_id_seq RESTART WITH 1")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH 1")


photos = []
40.times do |i|
  photos << Photo.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    image_url: "https://loremflickr.com/320/240?lock=#{rand(1..1000)}",
    dimension: Faker::Number.between(from: 10, to: 100).to_s + " x " + Faker::Number.between(from: 10, to: 100).to_s,
    price: Faker::Commerce.price
  )
end
puts photos


puts "Seed réussi!"
