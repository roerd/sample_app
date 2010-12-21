module SessionsHelper

  def sign_in(user)
    session[:user] = user
    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= session[:user]
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session.delete(:user)
    current_user = nil
  end
end
