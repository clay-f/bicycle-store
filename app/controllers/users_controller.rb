class UsersController < ApplicationController
  def user_login
  end

  def login
    user_name = params.fetch(:user)[:name]
    passwd = params.fetch(:user)[:password]
    user = User.find_by(name: user_name)
    if user.password == passwd
      session[:user_id] = user.id
      redirect_to root_url, notice: 'welcome, login succeed.'
    else
      redirect_to login_url, notice: 'username or password is invalid.'
    end
  end

  def logout
    sessino[:user_id] = nil
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end

end
