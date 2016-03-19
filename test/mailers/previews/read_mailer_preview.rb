# Preview all emails at http://localhost:3000/rails/mailers/read_mailer
class ReadMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/read_mailer/read_notification
  def read_notification
    ReadMailer.read_notification
  end

end
