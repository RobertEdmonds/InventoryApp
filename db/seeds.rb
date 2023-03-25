# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Employee.create!(name: "Robert Edmonds", phone_number: "3039444747", password: "Hello645$", password_confirmation: "Hello645$", username: "Programmer")
Product.create!(name: "Jeffrey Court", description: "Polar Orbit Blue 11.625 in. x 11.625 in. Interlocking Glossy Glass Mosaic Wall Tile (0.938 sq. ft./Each)", cost: 10.63, inventory: 23, color: "BLUE")
Picture.create!(product_id: 1, picture_url: "https://www.tiletrimonsale.com/wp-content/uploads/2022/11/blue-jeffrey-court-glass-tile-13014-1d_1000.jpg")