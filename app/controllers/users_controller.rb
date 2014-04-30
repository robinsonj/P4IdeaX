class UsersController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  before_action :set_user, only: [:show]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
