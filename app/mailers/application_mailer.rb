class ApplicationMailer < ActionMailer::Base
  default from: "myfancyrestaurant@gmail.com"
  default_url_options[:host] = 'https://pure-gorge-59227.herokuapp.com/'
  layout 'mailer'
end
