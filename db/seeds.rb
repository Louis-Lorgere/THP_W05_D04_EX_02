# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stroll.destroy_all
Dog.destroy_all
DogSitter.destroy_all
City.destroy_all

City.create(city_name: "Paris")
City.create(city_name: "Madrid")
City.create(city_name: "Londre")
City.create(city_name: "New-York")

100.times do
  DogSitter.create(name: Faker::Name.name, city: City.all.sample(1).first)
  Dog.create(name: Faker::Name.first_name, city: City.all.sample(1).first)
end

300.times do
  i = rand(0..3)
  Stroll.create(dog_sitter: DogSitter.where(city: City.all[i]).sample(1).first, dog: Dog.where(city: City.all[i]).sample(1).first)
end