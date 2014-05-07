class Admin::DashboardController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :require_admin

  # GET /admin
  def index

  end

  private

  def require_admin
    current_user.admin?
  end
end
