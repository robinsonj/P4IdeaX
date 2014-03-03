require 'spec_helper'

describe User do

  before do
    @user = User.new(name: 'test', email: 'test@test.com', password: 'testtest')
    @user2 = User.new(name: 'test2', email: 'test2@test.com', password: '')
  end

  subject { @user }

  describe "email address is already taken" do
    before do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      duplicate_user.save
    end

    it { should_not be_valid }
  end

  subject { @user2 }

  describe "password is blank" do
    it { should_not be_valid }
  end
end
