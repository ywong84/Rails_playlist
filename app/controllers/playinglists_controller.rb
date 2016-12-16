class PlayinglistsController < ApplicationController
  before_action :require_login, only: [:create]
  def create
    @playinglist = Playinglist.create ( play_params )
    redirect_to "/songs"
  end
  private
  def play_params
    params.require(:play).permit(:user_id, :song_id)
  end
end
