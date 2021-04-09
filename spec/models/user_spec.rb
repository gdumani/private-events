require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(username: 'test_name', email: 'test@gamil.com')
  end

  describe 'creation' do
    it 'should have one item created after being created' do
      expect(User.all.count).to eq(1)
    end
  end

  describe 'validations' do
    it 'validates presence' do
      @user = User.new
      @user.email = ''
      @user.validate
      expect(@user.errors[:email]).to include("can't be blank")

      @user.email = 'mina@gmail.com'
      @user.validate
      expect(@user.errors[:email]).to_not include("can't be blank")
    end

    it 'validates incorrect email format' do
      @user.email = 'minagmail.com'
      @user.validate
      expect(@user.errors[:email]).to include('invalid email address')
    end
  end

  describe 'Associations' do
    it { should have_many(:events) }
    it { should have_many(:attended_events).with_foreign_key(:event_user_id) }
    it { should have_many(:attending_events).through(:attended_events).with_foreign_key(:user_event_id) }
  end
end
