module SessionsHelper
  #Logs in user(adds id to temporary cookie, which deletes after user closes browser)
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user = @current_user ||= User.find_by(id: session[:user_id])
  end
end
