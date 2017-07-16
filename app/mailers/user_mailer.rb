class UserMailer < ApplicationMailer
  default from: "gt5955a@gmail.com"

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Blocipedia!")
  end
end
