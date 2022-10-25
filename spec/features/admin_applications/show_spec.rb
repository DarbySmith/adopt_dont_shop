require 'rails_helper'

RSpec.describe 'admin applications show page' do

  before:each do
    @shelter_1 = Shelter.create!(name: 'Durango shelter', city: 'Durango, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create!(name: 'Athens Area Humane', city: 'Athens, GA', foster_program: true, rank: 7)
    @shelter_3 = Shelter.create!(name: 'Bend City Shelter', city: 'Bend, OR', foster_program: true, rank: 8)
    @shelter_4 = Shelter.create!(name: 'Cats and Dogs of Chicago', city: 'Chicago, IL', foster_program: false, rank: 3)
    @shelter_5 = Shelter.create!(name: 'San Fran Loves Corgies', city: 'San Francisco, CA', foster_program: false, rank: 5)
    @pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter_1.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter_2.id)
    @pet_3 = Pet.create(adoptable: true, age: 8, breed: 'mix', name: 'Kumquat', shelter_id: @shelter_3.id)
    @pet_4 = Pet.create(adoptable: true, age: 8, breed: 'calico', name: 'Donuts', shelter_id: @shelter_3.id)
    @pet_5 = Pet.create(adoptable: false, age: 8, breed: 'corgie', name: 'Squeeker', shelter_id: @shelter_4.id)
    @application_1 = Application.create!(name: 'Pam Pulzone', street_address: '66225 Wallace Rd', city: 'Bend', state: 'OR', zip: 97702, description: 'Fenced yard, loving home', status: 'Pending')
    @application_2 = Application.create!(name: 'Dan Boston', street_address: '774 Boone Rd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult dogs', status:  'Pending')
  
    @application_pet_1 = ApplicationPet.create!(application: @application_1, pet: @pet_1)
    @application_pet_2 = ApplicationPet.create!(application: @application_1, pet: @pet_3)

  end

  it 'shows an applications details with button' do

    visit "/admin/applications/#{@application_1.id}"

    within("#pet-#{@pet_1.id}") do
      have_button?("Approve This Pet")
      expect(@pet_1.adoptable).to eq(true)
    end

    within("#pet-#{@pet_3.id}") do
      have_button?("Approve This Pet")
      expect(@pet_3.adoptable).to eq(true)
    end
  end

  it 'when approve button clicked, user is taken back to the admin show page
    and no longer button to approve pet' do
    
    visit "/admin/applications/#{@application_1.id}"

    within("#pet-#{@pet_1.id}") do
      click_button "Approve This Pet"
    end

    expect(current_path).to eq("/admin/applications/#{@application_1.id}")

    within("#pet-#{@pet_1.id}") do
      @pet1 = Pet.find(@pet_1.id)
      has_no_button?("Approve This Pet")
      has_no_button?("Reject")
      expect(page).to have_content("This pet has been approved")
      expect(@pet1.adoptable).to eq(false)
    end

    within("#pet-#{@pet_3.id}") do
      @pet3 = Pet.find(@pet_3.id)
      have_button?("Approve This Pet")

      expect(page).to_not have_content("This pet has been approved")
      expect(@pet3.adoptable).to eq(true)
    end
  end
end