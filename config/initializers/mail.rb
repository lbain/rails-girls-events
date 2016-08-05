ActionMailer::Base.smtp_settings = {
    :port      => 587,
    :user_name => ENV['USERNAME'],
    :password  => ENV['GMAIL_PASSWORD'],
    :domain    => 'heroku.com',
    :address   => 'smtp.gmail.com',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
ActionMailer::Base.delivery_method = :smtp
