class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @list = User.find(params[:id]).song_lists.select("artist, title, count(songs.id) as songs_count").group("songs.id")

  end
  def create
    @user = User.create( user_params )
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/songs"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
