require 'spec_helper'

describe User do

  describe "New standard Users" do

    it "creates new users with valid params" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "does not create users without a password" do
      user1 = build(:user, :password => '')
      user2 = build(:user, :password => nil)
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
    end

    it "does not create duplicate users (email)" do
      user1 = create(:user)
      user2 = build(:user, :email => user1.email)
      expect(user1).to      be_valid
      expect(user2).not_to  be_valid
    end

    it "does not create duplicate users (name)" do
      user1 = create(:user)
      user2 = build(:user, :name => user1.name)
      expect(user1).to      be_valid
      expect(user2).not_to  be_valid
    end
  end

  describe "New Omniauth-Twitter Users" do
    it "creates new users with valid params" do
      user = build(:twitter_user)
      expect(user).to be_valid
    end

    it "does not create users without a provider" do
      user1 = build(:twitter_user, :provider => '')
      user2 = build(:twitter_user, :provider => nil)
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
    end

    it "does not create users without a uid" do
      user1 = build(:twitter_user, :uid => '')
      user2 = build(:twitter_user, :uid => nil)
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
    end

    it "does not create duplicate users (provider + uid)" do
      user1 = create(:twitter_user)
      user2 = build(:twitter_user, :uid => user1.uid)
      expect(user1).to      be_valid
      expect(user2).not_to  be_valid
    end
  end

  describe "New Omniauth-Facebook Users" do
    it "creates new users with valid params" do
      user = build(:facebook_user)
      expect(user).to be_valid
    end

    it "does not create users without a provider" do
      user1 = build(:facebook_user, :provider => '')
      user2 = build(:facebook_user, :provider => nil)
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
    end

    it "does not create users without a uid" do
      user1 = build(:facebook_user, :uid => '')
      user2 = build(:facebook_user, :uid => nil)
      expect(user1).not_to be_valid
      expect(user2).not_to be_valid
    end

    it "does not create duplicate users (provider + uid)" do
      user1 = create(:facebook_user)
      user2 = build(:facebook_user, :uid => user1.uid)
      expect(user1).to      be_valid
      expect(user2).not_to  be_valid
    end
  end

  describe "Oauth records" do
    describe "Twitter users" do
      it "finds existing omniauth-twitter users" do
        user = create(:twitter_user)
        info = { :nickname => user.name }

        result = User.find_by_oauth(user.provider, user.uid, info)

        expect(result).to eq(user)
        expect(result).to be_valid
      end

      it "creates new omniauth-twitter users" do
        user = build(:twitter_user)
        provider  = user.provider
        uid       = user.uid
        info      = { :nickname => user.name }

        result = User.find_by_oauth(provider, uid, info)

        expect(result).to be_valid
      end
    end

    describe "Facebook users" do
      it "finds existing omniauth-facebook users" do
        user = create(:facebook_user)
        info = { :nickname => user.name }

        result = User.find_by_oauth(user.provider, user.uid, info)

        expect(result).to eq(user)
        expect(result).to be_valid
      end

      it "creates new omniauth-facebook users" do
        user = build(:facebook_user)
        provider  = user.provider
        uid       = user.uid
        info      = { :nickname => user.name }

        result = User.find_by_oauth(provider, uid, info)

        expect(result).to be_valid
      end
    end

    it "allows users with identical uids but different providers" do
      twitter_user  = create(:twitter_user)
      facebook_user = create(:facebook_user, :uid => twitter_user.uid)

      expect(twitter_user).to   be_valid
      expect(facebook_user).to  be_valid
    end

    it "allows users with identical providers but different uids" do
      twitter_user1   = create(:twitter_user)
      twitter_user2   = create(:twitter_user, :uid => twitter_user1.uid + '1')
      facebook_user1  = create(:facebook_user)
      facebook_user2  = create(:facebook_user, :uid => facebook_user1.uid + '1')

      expect(twitter_user1).to  be_valid
      expect(twitter_user2).to  be_valid
      expect(facebook_user1).to be_valid
      expect(facebook_user2).to be_valid
    end
  end
end
