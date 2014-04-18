class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    authorize "Twitter"
  end

  def facebook
    authorize "Facebook"
  end

  def passthru
    raise ActionController::RoutingError.new('Not Found')
  end

  private

    def auth_hash
      request.env["omniauth.auth"]
    end

    def authorize(kind)

      @user = User.find_by_oauth(auth_hash[:provider], auth_hash[:uid], auth_hash[:info])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind
        session["devise.#{kind.downcase}_data"] = auth_hash

        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:notice] = I18n.t "devise.omniauth_callbacks.failure", :kind => kind, :reason => 'FAILURE'
        redirect_to new_user_session_path
      end
    end
end
