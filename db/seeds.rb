# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  application_1 = Application.create!(name: 'Pam Pulzone', street_address: '66225 Wallace Rd', city: 'Bend', state: 'OR', zip: 97702, description: 'Fenced yard, loving home', status: 'In Progress')
  application_2 = Application.create!(name: 'Dan Boston', street_address: '774 Boone Rd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult dogs', status:  'In Progress')
  application_3 = Application.create!(name: 'Groupda Jay', street_address: '785 Klondie Way', city: 'Jefferson', state: 'NY', zip: 45789, description: 'Loving home and yard', status: 'Pending')
  application_4 = Application.create!(name: 'Kristen Sweat', street_address: '554 Jammy Rd', city: 'Las Vegas', state: 'NV', zip: 41235, description: 'Experience with special needs animals', status:  'Pending')
  
  shelter_1= Shelter.create(name: 'Aurora Shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  shelter_2 = Shelter.create(name: 'HSCO', city: 'Bend, OR', foster_program: true, rank: 4)
  shelter_3 = Shelter.create(name: 'Bend Animal Shelter', city: 'Bend, OR', foster_program: true, rank: 7)
  shelter_4 = Shelter.create(name: 'Athens Area Humane Society', city: 'Athens, GA', foster_program: false, rank: 8)

  pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter_1.id)
  pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: shelter_1.id)
  pet_3 = Pet.create(adoptable: false, age: 8, breed: 'mix', name: 'Kumquat', shelter_id: shelter_2.id)
  pet_4 = Pet.create(adoptable: true, age: 1, breed: 'tabby', name: 'Garfield', shelter_id: shelter_4.id)
  pet_5 = Pet.create(adoptable: true, age: 0, breed: 'calico', name: 'Postico', shelter_id: shelter_3.id)
  pet_6 = Pet.create(adoptable: true, age: 3, breed: 'corgie', name: 'Burrito', shelter_id: shelter_2.id)

  application_pet_1 = ApplicationPet.create!(application: application_3, pet: pet_1)
  application_pet_2 = ApplicationPet.create!(application: application_3, pet: pet_3)
  application_pet_3 = ApplicationPet.create!(application: application_4, pet: pet_6)
  application_pet_4 = ApplicationPet.create!(application: application_4, pet: pet_4)