class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.notification.subject
  #
  def notification(message)
    @message = message
    message_url = url_for :controller => 'messages', :action => 'show', :id => message.id, :email => false
    mail to: message.recipient.email, subject: "You've just got a new message"
  end
end
