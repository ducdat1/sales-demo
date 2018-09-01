module SessionsHelper
  def log_in user
    session[:user] = user
  end

  def log_out
    session.delete :user
  end

end
