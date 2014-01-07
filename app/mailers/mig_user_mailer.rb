class MigUserMailer < ActionMailer::Base
   default from: "munichinnovationgmbh@gmail.com"
  ONEPAGER_HOST = 'http://one-pager-mig.herokuapp.com'

  def new_one_pager(mail,host,id)
  	@url = 'http://' + host + Rails.application.routes.url_helpers.one_pagers_path + '/' + id
  	mail(to:mail, subject: 'New One Pager Request')
  end
end
