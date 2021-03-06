class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
  #
  #   if @user.persisted?
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

#   def twitter
#     # You need to implement the method below in your model
#     @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
#
#     if @user.persisted?
#       set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
#       sign_in_and_redirect @user, :event => :authentication
#     else
#       session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
#       redirect_to new_user_registration_url
#     end
#   end
# end


  # 追加
  # def facebook
  #   callback_from :facebook
  # end
  #
  def twitter
    callback_from :twitter
  end

  def failure
    @notice = "failure"
    redirect_to events_path, notice: 'failure'
  end


  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      print("persisted true")
      @notice = "persisted true"
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      print("persisted false")
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      @notice = "user is not persisted."
      redirect_to root_path, notice: 'user is not persisted.'
    end
  end

  def after_sign_in_path_for(resource)
    redirect_to events_path
  end



  # def twitter
  #   callback_for(:twitter)
  # end
  #
  # private
  #   # common callback method
  #   def callback_for(provider)
  #     @user = User.from_omniauth(request.env["omniauth.auth"])
  #     if @user.persisted?
  #       sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
  #       set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  #     else
  #       session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
  #       redirect_to new_user_registration_url
  #     end
  #   end
  #


end
