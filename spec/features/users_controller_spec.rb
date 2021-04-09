require 'rails_helper'

RSpec.feature 'UsersControllers', type: :feature do
  context 'create new user' do
    before :each do
      visit new_user_path
    end
    scenario 'should be successful' do
      within('form') do
        fill_in 'username',	with: 'Testname'
        fill_in 'Email', with: 'test@email'
      end
      click_button 'Sign Up'
      expect(page).to have_content('Successfully created')
    end
    scenario 'should fail' do
      within('form') do
        fill_in 'username',	with: 'Testname'
        fill_in 'Email', with: 'test'
      end
      click_button 'Sign Up'
      expect(page).to have_content('invalid email address')
    end
  end
end
