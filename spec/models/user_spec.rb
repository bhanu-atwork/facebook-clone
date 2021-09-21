require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'schema' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password).of_type(:string) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:mobile_no).of_type(:integer) }
  end

  describe 'create' do
    it { expect { user.save }.to change(User, :count).by(1) }
  end

  describe 'validation' do 
    it 'should have length equals 10' do
      mobile_no_length = user.mobile_no.digits.count
      expect(mobile_no_length).to eq(10)
    end
    it 'should have minimum password length 6' do
      expect(user.password.length).to be >= 6
    end
    it 'should not take invalid email' do
      expect(user).to_not allow_value('').for(:email)
      expect(user).to_not allow_value('abc#@.gmail.com').for(:email)
    end
  end
  
  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end

end
