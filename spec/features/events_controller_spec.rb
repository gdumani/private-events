require 'rails_helper'

RSpec.feature "EventsControllers", type: :feature do
  context 'Create new event' do 
    before :each do
      visit new_user_path
      within('form') do 
        fill_in 'username',	with: 'Testname'
        fill_in 'Email', with: 'test@email'
      end
      click_button 'Sign Up'
      visit events_new_path
    end 
     scenario 'should be successful' do
      within('form') do
        fill_in 'Description', with: 'Event test'
        select((Time.now.year+1), from: 'event_event_date_1i')
      end
      click_button 'Submit'
      expect(page).to have_content('was created successfully')
    end 
    scenario 'should be successful' do
      within('form') do
        fill_in 'Description', with: 'Event test'
        select((Time.now.year-1), from: 'event_event_date_1i')
      end
      click_button 'Submit'
      expect(page).to have_content('Invalid date')
    end 

   end
end
