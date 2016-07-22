ActionMailer::Base.smtp_settings = {
    :port      => 587,
    :user_name => ENV['USERNAME'],
    :password  => ENV['PASSWORD'],
    :domain    => 'heroku.com',
    :address   => 'smtp.sendgrid.net',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
ActionMailer::Base.delivery_method = :smtp
