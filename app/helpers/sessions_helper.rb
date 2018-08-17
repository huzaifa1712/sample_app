module SessionsHelper
  #Logs in user(adds id to temporary cookie, which deletes after user closes browser)
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the current user as an instance variable
  # ||= - If @current_user is nil, assign to the right hand statement (User.find_by)
  #else, do nothing
  #Same as @current_user = @current_user || User.find_by...
  #because @current_user is true if not empty, or nil/false in which case either are
  #false in a boolean context.
  def current_user
    @current_user = @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    #!current_user.nil?
    !!(current_user)
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
