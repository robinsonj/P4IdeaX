class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_user, only: [:show]

  # GET /users/:id
  def show
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
