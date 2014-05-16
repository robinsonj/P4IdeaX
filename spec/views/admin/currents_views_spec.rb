require 'spec_helper'

describe 'AdminViews - Currents' do

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]

    @user = create(:user)
    @user.confirm!
    @user.admin = true

    sign_in @user
  end

  describe 'admin/currents/edit' do
    before(:each) do
      @current = assign(:current, create(:current, owner_id: @user.id))
      assign(:admin_users, [@user])
    end

    it 'renders the edit admin_current form' do
      render template: 'admin/currents/edit'

      assert_select "form[action=?][method=?]", admin_current_path(@current), 'post' do
      end

      expect(rendered).to render_template('admin/currents/edit')
    end
  end

  describe 'admin/currents/index' do
    before(:each) do
      assign(:current, Current.new)
      assign(:currents, [
        create(:current, owner_id: @user.id),
        create(:current, owner_id: @user.id)
      ])

      assign(:admin_users, [@user])
    end

    it 'renders a list of admin/currents' do
      render template: 'admin/currents/index'
      expect(rendered).to render_template('admin/currents/index')
    end
  end
end
