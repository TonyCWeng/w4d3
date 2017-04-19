class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    return render :new if @user.nil?

    if @user.valid?
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy

  end
end
