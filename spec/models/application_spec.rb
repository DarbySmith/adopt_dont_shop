require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many :application_pets}
    it {should have_many(:pets).through(:application_pets)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :street_address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
  end

  before(:each) do
    @application_1 = Application.create!(name: 'Pam Pulzone', street_address: '66225 Wallace Rd', city: 'Bend', state: 'OR', zip: 97702, description: 'Fenced yard, loving home', status: 'In Progress')
    @application_2 = Application.create!(name: 'Dan Boston', street_address: '774 Boone Rd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult dogs', status:  'In Progress')
    @shelter_1= Shelter.create(name: 'Aurora Shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'HSCO', city: 'Bend, OR', foster_program: true, rank: 4)
    @pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter_1.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter_1.id)
    @pet_3 = Pet.create(adoptable: false, age: 8, breed: 'mix', name: 'Kumquat', shelter_id: @shelter_2.id)
  end

  describe 'class methods' do
    describe '#pending_apps' do
      it "returns a list of all pending applications" do
        application_3 = Application.create!(name: 'Chase Boston', street_address: '774 YodaRd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult cats', status:  'Pending')
        application_4 = Application.create!(name: 'Don Juan', street_address: '788 Tandy Rd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult dogs', status:  'Pending')
        
        expect(Application.pending_apps).to eq([application_3, application_4])
        expect(Application.pending_apps).to_not eq(@application_1)
        expect(Application.pending_apps).to_not eq(@application_2)
      end
    end
  end 
end