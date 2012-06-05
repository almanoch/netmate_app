class UserMailer < ActionMailer::Base
  default from: "notifications@netmate.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://netmate.com/signin"
    mail(to: user.email, subject: "Welcome to Netmate")
  end
end
