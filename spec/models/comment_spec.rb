require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  describe 'schema' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:post_id).of_type(:integer) }
    it { should have_db_column(:body).of_type(:string) }
  end

  describe 'create' do
    it { expect { comment.save }.to change(Comment, :count).by(1) }
  end

  describe 'validation' do 
    it 'should have length in range of 6 to 30' do
      expect(comment.body.length).to be >= 6
      expect(comment.body.length).to be <= 30
    end
  end

  describe 'associations' do
    it { should have_many(:likes) }
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end