require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe 'Post #create' do

    context 'with logged-out user' do
      it 'should not be able to post' do
        params = { type: "Post", id: 1 }
        post :create, params: params
        expect(Post.count).to eq(0)
      end
    end
    context 'with logged-in user' do
      let(:user) { create(:user) }
      let (:params) { params = { body: "Lets Learn ROR" } }
      before do
        require_login_as(user)
      end

      it "should increase count of post by" do
        expect { post :create, params: params }.to change(Post, :count).by(1)
      end
      it "should redirect to user page" do
        post :create, params: params
        expect(response).to redirect_to(user_path(user.id))
      end
    end
  end
end
