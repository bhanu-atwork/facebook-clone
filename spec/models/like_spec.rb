require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like_post) { build(:like, :for_post) }
  let(:like_comment) { build(:like, :for_comment) }

  describe 'schema' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:likeable_id).of_type(:integer) }
    it { should have_db_column(:likeable_type).of_type(:string) }
  end

  describe 'create' do
    it { expect { like_post.save }.to change(Like, :count).by(1) }
    it { expect { like_comment.save }.to change(Like, :count).by(1) }
  end

end