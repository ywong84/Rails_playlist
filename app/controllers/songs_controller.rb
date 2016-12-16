class SongsController < ApplicationController
  before_action :require_login, only: [:create]
  def create
    @song = current_user.songs.create( song_params )
    @songlist = Playinglist.create(user_id: current_user.id, song_id:@song.id)
    if @song.valid?
      redirect_to "/songs"
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to "/songs"
    end
  end

  def show
  @user = User.find(current_user.id)
  @songs = Song.all
  end

  def index
    @song = Song.find(params[:id])
    @song1 = Song.find(params[:id]).song_users.select("users.id, first_name, last_name, count(users.id) as users_count").group("users.id")
  end
  private
  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
Song.find(2).song_users.select("users.id, first_name, last_name").group("users.id")
