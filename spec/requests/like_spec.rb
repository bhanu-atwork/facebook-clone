require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { create(:user) }
  let(:like_post) { create(:like, :for_post) }
  describe 'Like #create' do
    context 'with logged-out user' do
      it 'should not be able to like' do
        params = { type: "Post", id: like_post.likeable_id }
        post :create, params: params
        expect(Like.count).to eq(0)
      end
    end
    
    context 'with logged-in user' do
      
      before do
        require_login_as(user)
      end

      it "should increase count of like by 1" do
        params = { type: "Post" , id: like_post.likeable_id }
        expect { post :create, params: params }.to change(Like, :count).by(1)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'Like #destroy' do

  context 'with logged-out user' do
    it 'should not be able to delete like' do
      params = { type: "Post", id: like_post.likeable_id }
      post :create, params: params
      expect(Like.count).to eq(0)
    end
  end
  
  context 'with logged-in user' do
    let(:user) { create(:user) }
    let(:like_post) { create(:like, :for_post) }
    before do
      require_login_as(user)
    end

    it "should decrease count of like by 1" do
      params = { type: "Post" , id: like_post.likeable_id }
      expect { delete :destroy, params: params }.to change(Like, :count).by(1)
      expect(response.status).to eq(200)
    end
  end
end
end
