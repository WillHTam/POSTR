class AutoMailer < ApplicationMailer
  default from: "etchikei@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to POSTR!')
  end

end
