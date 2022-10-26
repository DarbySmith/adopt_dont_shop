require 'rails_helper'

RSpec.describe "Admin apps index" do
  it 'shows all applications and their information' do
    application_1 = Application.create!(name: 'Pam Pulzone', street_address: '66225 Wallace Rd', city: 'Bend', state: 'OR', zip: 97702, description: 'Fenced yard, loving home', status: 'In Progress')
    application_2 = Application.create!(name: 'Dan Boston', street_address: '774 Boone Rd', city: 'Greenville', state: 'SC', zip: 56843, description: 'Experience with difficult dogs', status:  'In Progress')

    visit "/admin/applications"
    
    expect(page).to have_content(application_1.name)
    expect(page).to have_content(application_2.name)
  end
end