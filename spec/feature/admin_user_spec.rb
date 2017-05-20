require 'rails_helper'

RSpec.describe 'Admin management of users', type: :feature do
  let!(:location) { FactoryGirl.create(:residency_location) }
  let!(:resident) { FactoryGirl.create(:user,
    name: 'Resident Name',
    email: 'resident@email.com',
    residency_location_id: location.id,
    status: 'R2',
    password: 'password',
    password_confirmation: 'password')
  }

  before do
    login_admin
  end

  fdescribe 'list of users' do
    it 'shows all users and their corresponding data' do
      click_on 'Users'

      expect(page).to have_content 'Residents'
      expect(page).to have_content 'Resident Name'
      expect(page).to have_content 'resident@email.com'
      expect(page).to have_content location.name

    end
  end

  def login_admin
    FactoryGirl.create(:user,
      email: 'test@email.com',
      password: 'password',
      password_confirmation: 'password',
      admin: true,
      residency_location_id: location.id
    )
    visit '/'

    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'

    click_button 'Log in'
  end
end
