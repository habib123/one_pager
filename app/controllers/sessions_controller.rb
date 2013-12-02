class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    #if !user.confirmed
    #  flash.now[:error] = 'Your account is not confirmed yet.'
    #  render 'new'
    #elsif user && user.authenticate(params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to :controller => 'users', :action => 'profile'
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
      sign_out
      redirect_to :controller => 'users', :action => 'index' and return
  end

end
