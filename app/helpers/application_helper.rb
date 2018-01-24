module ApplicationHelper
  def user_login?
    if session[:user_id]
      true
    else
      false
    end
  end
end
