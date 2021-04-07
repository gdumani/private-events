require 'rails_helper'

RSpec.feature 'EventsControllers', type: :feature do
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
        select((Time.now.year + 1), from: 'event_event_date_1i')
      end
      click_button 'Submit'
      expect(page).to have_content('was created successfully')
      expect(page).to have_content('Event test')
    end
    scenario 'should be successful' do
      within('form') do
        fill_in 'Description', with: 'Event test'
        select((Time.now.year - 1), from: 'event_event_date_1i')
      end
      click_button 'Submit'
      expect(page).to have_content('Invalid date')
    end
  end
  context 'Event index and user show pages' do
    before :each do
      @user1 = User.create(username: 'u1', email: 'u1@mail')
      @event1 = @user1.events.create(description: 'User1 text', event_date: Time.now + 10_000)
      visit login_path
      within('form') do
        fill_in 'username',	with: 'u1'
      end
      click_button 'Sign In'
    end
    scenario 'successful display of index page' do
      expect(page).to have_content('Upcoming Events')
      expect(page).to have_content(@user1.events.first.description)
      expect(page).to have_content('Past Events')
    end
    scenario 'successful display of show page' do
      click_link('My Events')
      expect(page).to have_content('Created Events')
      expect(page).to have_content(@user1.events.first.description)
      expect(page).to have_content('Attending Events')
    end
  end
end
