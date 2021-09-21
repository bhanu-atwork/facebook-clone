require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe 'Post #create' do
    let(:user) { create(:user) }
    let(:user_post) {create(:post, user: user)}
    context 'with logged-out user' do
      it 'should not be able to post' do
        params = { body: "It was fun", post_id: user_post.id }
        post :create, params: params
        expect(Comment.count).to eq(0)
    end
  end
    context 'with logged-in user' do
      
      let (:params) { params = { body: "It was fun" , post_id: user_post.id} }
      before do
        require_login_as(user)
      end

      it "should increase count of comment by 1" do
        expect { post :create, params: params }.to change(Comment, :count).by(1)
      end
      it "should redirect to user page" do
        post :create, params: params
        expect(response).to redirect_to(user_path(user.id))
      end
    end
  end
end
