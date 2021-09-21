require 'rails_helper'

RSpec.describe Friend, type: :model do
  let(:friend) {       
  user1 = create(:user)
  user2 = create(:user)
  build(:friend, first_user_id: user1.id, second_user_id: user2.id) }

  describe 'schema' do
    it { should have_db_column(:first_user_id).of_type(:integer) }
    it { should have_db_column(:second_user_id).of_type(:integer) }
    it { should have_db_column(:status).of_type(:integer) }
  end

  describe 'create' do
    it { expect { friend.save }.to change(Friend, :count).by(1) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end