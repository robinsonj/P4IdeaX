require 'spec_helper'

describe Current do

  before(:each) do
    @user = create(:user)
    @user.confirm!
  end

  describe 'New Currents' do
    it 'creates new currents with valid params' do
      current = build(:current, owner_id: @user.id)

      expect(current).to be_valid
    end

    it "does not create currents with a 'nil' owner_id" do
      current = build(:current, owner_id: nil)

      expect(current).not_to be_valid
    end

    it 'does not create currents with an invalid owner_id' do
      unsaved_user = build(:user)
      current = build(:current, owner_id: unsaved_user.id)

      expect(current).not_to be_valid
    end

    it 'does not create duplicate currents' do
      current   = create(:current, owner_id: @user.id)
      current2  = current.dup

      expect(current).to be_valid
      expect(current2).not_to be_valid
    end

    it 'does not create currents with the same name' do
      current   = create(:current, owner_id: @user.id)
      current2  = build(:current, owner_id: @user.id, title: current.title)

      expect(current).to be_valid
      expect(current2).not_to be_valid
    end

    it 'does not create currents without descriptions' do
      current   = build(:current, owner_id: @user.id, description: nil)
      current2  = build(:current, owner_id: @user.id, description: '')

      expect(current).not_to be_valid
      expect(current2).not_to be_valid
    end
  end
end
