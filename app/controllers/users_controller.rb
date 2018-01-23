class UsersController < ApplicationController
  def user_login
  end

  def login
    user_name = params.fetch(:user)[:name]
    passwd = params.fetch(:user)[:password]
    user = User.find_by(name: user_name, password_digest: passwd)
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'login succeed.'
    else
      redirect_to login_url, notice: 'username or password is invalid.'
    end
  end

  def create
  end

  def logout
  end


  private

    def user_params
      params.require(:user).permit(:name, :password)
    end

end
