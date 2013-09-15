module SessionsHelper

  def u_sign_out
    destroy_user_session_path
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def current_user?(user)
    user == current_user
  end
  
end
