ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => 'railsgirlssyd@gmail.com',
    :password  => 'DnnSYRq_1O8r1HtUwnofoQ',
    :domain    => 'heroku.com'
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'DnnSYRq_1O8r1HtUwnofoQ'
end