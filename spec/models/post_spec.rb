require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  describe 'schema' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:body).of_type(:string) }
  end

  describe 'create' do
    it { expect { post.save }.to change(Post, :count).by(1) }
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should have_many(:comments) }
    it { should have_one_attached(:image) }
    it { should belong_to(:user) }
  end
end