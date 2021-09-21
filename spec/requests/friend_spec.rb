require 'rails_helper'

RSpec.describe FriendsController, type: :controller do

  describe 'Friend #create' do
    
    context 'with logged-out user' do
      it 'should not be able to make friend' do
        s_user = create(:user)
        params = { friend_id: s_user.id }
        post :create, params: params
        expect(Friend.count).to eq(0)
      end
    end
    
    context 'with logged-in user' do
      let(:f_user) { create(:user) }
      let(:s_user) { create(:user) }
      let(:friend) { build(:friend, first_user_id: f_user.id, second_user_id: s_user.id) }

      before do
        require_login_as(f_user)
      end

      it "should increase count of friend by 1" do
        params = { friend_id: s_user.id }
        expect { post :create, params: params }.to change(Friend, :count).by(1)
      end
      it "should redirect to user page" do
        params = { friend_id: s_user.id }
        post :create, params: params
        expect(response).to redirect_to(friend_path(f_user.id))
      end
    end
  end
end
