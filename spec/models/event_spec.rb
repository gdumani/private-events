require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create!(username: "test_name", email: "test@gamil.com")
    @event = @user.events.create!(description: "Test event", event_date: Time.now + 1.hour)
  end 

  describe "creation" do
    it "should have one item created after being created" do
      expect(Event.all.count).to eq(1)
    end
  end

  describe "validations" do 

    it 'validates presence' do
        @event = @user.events.new
        @event.description = ''
        @event.validate.presence
        should validate_presence_of(:description).with_message("can't be blank")
    end

  end

  describe 'Associations' do
    it { should belong_to(:creator).with_foreign_key(:user_id) }
    it { should have_many(:attended_events).with_foreign_key(:user_event_id) }
    it { should have_many(:attendees).through(:attended_events).with_foreign_key(:event_user_id)}
  end 

  describe 'Upcoming envents scope' do
    it 'returns upcoming and previous event when event is tomorrow' do
      expect(Event.upcoming_events.count).to eq(1) 
      expect(Event.previous_events.count).to eq(0) 
    end
  end

  describe 'Upcoming envents scope' do
    it 'returns upcoming and previous event when event is tomorrow' do
      @user.events.create!(description: "Past event", event_date: Time.now - 1.hour)    
      expect(Event.upcoming_events.count).to eq(1) 
      expect(Event.previous_events.count).to eq(1) 
    end
  end

  
end
