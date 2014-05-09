class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :require_admin
  before_action :authenticate_user!

  private

  def require_admin
    # redirect_to root_path, notice: "#{t 'authorization.admin.unauthorized'}" unless current_user.admin?
    redirect_to root_path unless current_user.try(:admin?)
  end
end
