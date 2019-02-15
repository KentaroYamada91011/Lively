class LikesController < ApplicationController
  before_action :set_event

    def create
      #いいねを探して増やす
      @like = Like.create(user_id: current_user.id,event_id: params[:event_id])
      @like.save
      redirect_to event_path(@event)

    end

    def destroy
      @like = Like.find_by(user_id: current_user.id,event_id: params[:event_id])
      @like.destroy
      redirect_to event_path(@event)

    end

  private

  def set_event
    @event = Event.find(params[:event_id])
 end
end
