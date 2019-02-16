class ArtistsController < ApplicationController
  PER = 10
  def index
    if params[:search] == nil
      @artists = Artist.page(params[:page]).per(PER)
    elsif params[:search] == ""
      @artists = Artist.page(params[:page]).per(PER)
    else
      #部分検索
      @artists = Artist.where("name LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @event = Event.where(artist_id: [:id])

  end

  def edit
    @artist = Artist.find(params[:id])
  end
  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      redirect_to action: "show"
      # 更新に成功したときの処理
    else
      render 'edit'
    end
  end

private
  def artist_params
    params.require(:artist).permit(:name,:image,:memo)
  end
end
