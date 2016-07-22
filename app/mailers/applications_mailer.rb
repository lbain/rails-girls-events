class ApplicationsMailer < ActionMailer::Base
  include SendGrid

  default from: 'railsgirlssyd@gmail.com'

  def application_received(application)
    mail(
      subject: 'Thanks for applying!',
      to: user_info(application),
      vars: {
        'NAME' => application.user.name,
        'SUBJECT' => 'Thanks for applying!'
      },
      important: true,
      inline_css: true)
  end

  def application_success(application)
    options = {}
    if !Rails.env.production?
      options[:port] = 3000
    end

    mail(
      subject: 'Welcome to Rails Girls!',
      to: user_info(application),
      vars: {
        'NAME' => application.user.name,
        'SUBJECT' => 'Welcome to Rails Girls!',
        'ACCEPT_LINK' => application_status_url(application, 'accepted', options),
        'DECLINE_LINK' => application_status_url(application, 'declined', options),
      },
      important: true,
      inline_css: true)
  end

  def application_rejected(application)
    # always send the rejection emails to us, if we're happy with what it says
    # then forward them on, but otherwise re-write as needed
    user_info = user_info(application).merge({email: 'railsgirlssyd@gmail.com'})

    mail(
      template: 'application-rejected',
      subject: 'Your Rails Girls application was not successful',
      to: user_info,
      vars: {
        'NAME' => application.user.name,
        'SUBJECT' => 'Your Rails Girls application was not successful'
      },
      important: true,
      inline_css: true)
  end

  private
  def user_info(application)
    { name: application.user.name, email: application.user.email }
  end

end
