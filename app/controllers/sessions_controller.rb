class SessionsController < ApplicationController
  def index
  end

  def create
    if user = User.authenticate(params[:session][:name], params[:session][:password])
      log_in user
      redirect_to session[:return], notice: 'Login success'
    else
      redirect_to login_path, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'logged out'
  end
end
