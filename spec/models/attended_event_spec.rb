require 'rails_helper'

RSpec.describe AttendedEvent, type: :model do
  before(:each) do
    @user = User.create(username: 'some_name', email: 'some@mail.com')
    @event = @user.events.create(description: 'My first attended event', event_date: Time.now + 2.days)
    @attending_event = @user.attended_events.create!(user_event_id: @event.id)
  end
  describe 'creation' do
    it 'should have one attended event after adding the event' do
      expect(AttendedEvent.count).to eq(1)
    end
  end

  describe 'Associations' do
    it { should belong_to(:event).with_foreign_key(:user_event_id) }
    it { should belong_to(:user).with_foreign_key(:event_user_id) }
  end

  describe 'Validations' do
    it { expect(@attending_event).to validate_uniqueness_of(:event_user_id).scoped_to(:user_event_id) }
  end
end
