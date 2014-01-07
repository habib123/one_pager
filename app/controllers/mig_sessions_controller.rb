class MigSessionsController < ApplicationController
  def new
  end

  def create
     @mig_user = MigUser.find_by(email: params[:mig_session][:email].downcase)
    if  @mig_user &&  @mig_user.authenticate(params[:mig_session][:password])
      mig_sign_in @mig_user
      redirect_to  one_pager_approve_path
    else
      flash.now[:error] = 'Wrong email or password !!! please try again'
      render 'new'
    end
  end
end
