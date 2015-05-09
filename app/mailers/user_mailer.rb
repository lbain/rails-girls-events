class UserMailer < MandrillMailer::TemplateMailer
  default from: 'railsgirlssyd@gmail.com'

  def application_recieved(user)
    user_info = {name: user.name, email: user.email}

    mandrill_mail(
      template: 'application-recieved',
      subject: 'Thanks for applying!',
      to: user_info,
      vars: {
        'NAME' => user.name,
        'SUBJECT' => 'Thanks for applying!'
      },
      important: true,
      inline_css: true)
  end

  def application_success(user)
    user_info = {name: user.name, email: user.email}

    mandrill_mail(
      template: 'application-successful',
      subject: 'Welcome to Rails Girls!',
      to: user_info,
      vars: {
        'NAME' => user.name,
        'SUBJECT' => 'Welcome to Rails Girls!',
        'ACCEPT_LINK' => user_status_path(user, 'accept'),
        'DELCLINE_LINK' => user_status_path(user, 'decline'),
      },
      important: true,
      inline_css: true)
  end
end