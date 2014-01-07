class MigUsersController < ApplicationController


  def show
    @mig_user = MigUser.find(params[:id]) 
  end

  def new
   @mig_user = MigUser.new
  end

  def create
    @mig_user = MigUser.new(mig_user_params)
    if @mig_user.save
       redirect_to @mig_user
    else
      render 'new'
    end
  end

  private

    def mig_user_params
      params.require(:mig_user).permit(:email, :password ,:password_confirmation)
    end

end
