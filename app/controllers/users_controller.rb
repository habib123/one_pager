require 'json'

class UsersController < ApplicationController

  def index
    #raise current_user.inspect
    #@user = current_user
    #puts JSON.pretty_generate(current_user.to_json)
  end

  def show
  end

  def new
    @user = User.new
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = 'Welcome! You information has saved. You will receive a confirmation email with secure link.
                          After confirm you can access your account.'

      redirect_to action: 'registered'

    else
      render 'register'
    end
  end

  def registered

  end

  def profile

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
