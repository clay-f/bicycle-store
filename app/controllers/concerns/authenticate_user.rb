module AuthenticateUser
  def authorized
    unless session[:user_id]
      redirect_to root_url
    end
  end
end