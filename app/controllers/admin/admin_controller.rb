class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :require_admin

  private

  def require_admin
    # redirect_to root_path, notice: "#{t 'authorization.admin.unauthorized'}" unless current_user.admin?
    redirect_to root_path unless current_user.admin?
  end
end
