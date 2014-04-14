class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    puts auth_hash.inspect

    if false
      render home_index
    else
      redirect_to new_user_registration_path
    end
  end

  private

    def auth_hash
      request.env["omniauth.auth"]
    end
end
