module MigSessionsHelper

  def mig_sign_in(mig_user)
     remember_token = MigUser.new_remember_token
    if params[:mig_session][:remember_me]
      cookies.permanent[:remember_token] = remember_token	
   else
      cookies[:remember_token] = remember_token	 
    end
    mig_user.update_attribute(:remember_token, MigUser.encrypt(remember_token))
    self.mig_current_user = mig_user
  end

  def mig_signed_in?
    !mig_current_user.nil?
  end

  def mig_current_user=(mig_user)
    @mig_current_user = mig_user
  end

  def mig_current_user
    remember_token = MigUser.encrypt(cookies[:remember_token])
    @mig_current_user ||= MigUser.find_by(remember_token: remember_token)if cookies[:remember_token]
  end
  def mig_sign_out
    self.mig_current_user = nil
    cookies.delete(:remember_token)
  end
   def mig_signed_in_user
      redirect_to mig_signin_url, notice: "Please sign in." unless mig_signed_in?
    end

    def mig_correct_user
      @mig_user = MigUser.find(params[:id])
      redirect_to(root_url) unless mig_current_user?(@mig_user)
    end
    def destroy
    	mig_sign_out
    	flash[:notice] = "Successfully Signout."
    	redirect_to mig_signin_path and return
    end
end
