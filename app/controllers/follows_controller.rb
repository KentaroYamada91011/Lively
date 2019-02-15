class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
      #いいねを探して増やす
      @follow = Follow.create(artist_id: params[:artist_id],user_id: current_user.id)
      # @follow.save
      # render  'events/show', event: @event
      redirect_to artist_path(params[:artist_id])
  end

  def destroy
      @follow = Follow.find_by(user_id: current_user.id,artist_id: params[:artist_id])
      @follow.destroy
      # render  'events/show'
      redirect_to artist_path(params[:id])
  end
end
