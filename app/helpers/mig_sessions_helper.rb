module MigSessionsHelper

  def mig_sign_in(mig_user)
    remember_token = MigUser.new_remember_token
    cookies.permanent[:remember_token] = remember_token
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
    @mig_current_user ||= MigUser.find_by(remember_token: remember_token)
  end
end
