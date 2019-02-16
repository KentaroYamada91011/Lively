class EventsController < ApplicationController
  PER = 10
  def index
    if params[:date] == nil
      @event = Event.page(params[:page]).per(PER)
    elsif params[:date] == ""
      @event = Event.page(params[:page]).per(PER)
    else
      date = params[:date].to_date
      @event = Event.where(start_time: date.beginning_of_day .. date.end_of_day).page(params[:page]).per(PER)
    end
    unless current_artist == nil
      @artist = Artist.find(current_artist.id)
    end
  end


  def show
    @event = Event.find(params[:id])
    @likes_count = Like.where(event_id: @event.id).count
    # @likes = Like.where(prototype_id: params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.artist = current_artist

  #新しいTweetの保存に成功した場合
    if @event.save
    #index.html.erbにページが移る
      redirect_to action: "index"
  #新しいTweetの保存に失敗した場合
    else
    #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.artist == current_artist
    else
      redirect_to action: "index"
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.artist == current_artist
     @event = Event.destroy(params[:id])
     redirect_to action: "index"
    else
      redirect_to action: "index"
    end
  end

  def update
      @event = Event.find(params[:id])
      if @event.update_attributes(event_params)
        redirect_to action: "index"
        # 更新に成功したときの処理
      else
        render 'edit'
      end
  end

  def home
  end
  def privacy_policy
  end
  def terms_of_service
  end


  private
    def event_params
      params.require(:event).permit(:name,:artist_id,:start_time,:end_time,:address,:price,:memo,:image,:start_time_,:door_price,:adv_drink,:door_drink,:open_time,:date)
    end
end
