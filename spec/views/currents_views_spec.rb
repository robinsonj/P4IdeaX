require 'spec_helper'

describe 'CurrentsViews' do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    sign_in @user
  end

  describe 'currents/index' do
    before(:each) do
      assign(:currents, [
        create(:current, owner_id: @user.id),
        create(:current, owner_id: @user.id)
      ])
    end

    it 'renders a list of currents' do
      render template: 'currents/index'
    end
  end

  describe 'currents/show' do
    before(:each) do
      @current = assign(:current, create(:current, owner_id: @user.id))
    end

    it 'renders attributes in <p>' do
      render template: 'currents/show'
    end
  end
end
