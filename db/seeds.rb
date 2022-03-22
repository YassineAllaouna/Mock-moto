# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Moto.destroy_all

puts "Creating motos..."
kawazaki = { model: "GPX 750", brand: "Kawazaki", address: "7 Boundary St, London E2 7JE", power: 150, kilometers: 4000 }
triumph = { model: "Tiger 800", brand: "Triumph", address: "56A Shoreditch High St, London E1 6PQ", power: 150, kilometers: 3000 }

[kawazaki, triumph].each do |attributes|
  moto = Moto.create!(attributes)
  puts "Created #{moto.model}"
end
puts "Finished!"
