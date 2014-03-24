# module DeviseMacros
#   def login_user
#     before(:each) do
#       if @request
#         @request.env["devise.mapping"] = Devise.mappings[:user]
#       end

#       user = create(:user)
#       user.confirm!
#       sign_in user
#     end
#   end

#   def login
#     user = create(:user)
#     user.confirm!
#     sign_in user, scope: :user
#     user
#   end
# end

# RSpec.configure do |config|
#   config.include DeviseMacros
# end
