class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id
      redirect_to "/songs"
    else
      flash[:errors] = ["Invalid login"]
      redirect_to "/"
    end
  end

  def destroy
    session.clear
    redirect_to "/"
  end
end
