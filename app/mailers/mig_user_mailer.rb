class MigUserMailer < ActionMailer::Base
  default from: "from@example.com"

 def mig_notification_email(anonymous_user)
    @anonymous_user = anonymous_user
    @url  =  "<a href="http://localhost:3000/mig_signin">http://localhost:3000/mig_signin</a>"
    mail(to: @anonymous_user.email, subject: 'Welcome to My Awesome Site')
  end
end
