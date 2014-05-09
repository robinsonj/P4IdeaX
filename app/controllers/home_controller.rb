class HomeController < ApplicationController
  before_action :create_first_admin_user

  def index
  end

  def about
  end

  def contact
  end

  def terms_of_use
  end

  private

  def create_first_admin_user
    redirect_to new_user_registration_path, notice: 'Please create the first admin user.' if User.count == 0
  end

end
