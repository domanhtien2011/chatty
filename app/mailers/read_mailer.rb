class ReadMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.read_mailer.read_notification.subject
  #
  def read_notification(message)
    @message = message
    mail to: message.sender.email, subject: "Your message has been read"
  end
end
