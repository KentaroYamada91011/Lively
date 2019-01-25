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
  def login
  end

private
  def user_params
    params.require(:user).permit(:name,:image)
  end
end
