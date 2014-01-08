class MigUserMailer < ActionMailer::Base
  default from: "munichinnovationgmbh@gmail.com"
  ONEPAGER_HOST = 'http://one-pager-mig.herokuapp.com'

  def mig_notification_email_approve(email)
  	#@url = 'http://' + host + Rails.application.routes.url_helpers.one_pagers_path + '/' + id
  	mail(to:email, subject: 'Your request has been approved')
  end
  def mig_notification_email_deny(email)
  	#@url = 'http://' + host + Rails.application.routes.url_helpers.one_pagers_path + '/' + id
  	mail(to:email, subject: 'Your request has been denied')
  end
end
