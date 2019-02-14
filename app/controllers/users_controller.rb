class UsersController < ApplicationController
  def show
    # @user = current_user.id
    @user = User.find(params[:id])
    @follow = Follow.where(user_id: params[:id])
    # @event = Event.where(artist_id: @follow.artist_id)

    @followingArtists = @user.following_artists
    @events = Event.where(artist_id: @followingArtists)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to action: "show"
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end
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

private
  def user_params
    params.require(:user).permit(:name,:image)
  end
end
