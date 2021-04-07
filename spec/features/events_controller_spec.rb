require 'rails_helper'

RSpec.feature "EventsControllers", type: :feature do
  context 'Create new event' do 
    before :each do
      visit events_new_path
    end
      within('form') do
        fill_in 'Description', with: 'Event test'
        select((Time.now+10000), :from => 'Event date')
      end
      click_button 'Submit'
      expect(page).to have_content('was created successfuly')
        
  end
end
