class AutoMailerPreview < ActionMailer::Preview
  def welcome_mail_preview
    AutoMailer.welcome_email(User.first)
  end
end
