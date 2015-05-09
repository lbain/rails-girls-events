class UserMailer < MandrillMailer::TemplateMailer
  default from: 'railsgirlssyd@gmail.com'

  def application_success(user)
    user_info = {name: user.name, email: user.email}

    mandrill_mail(
      template: 'application-successful',
      subject: 'Thanks for applying!',
      to: user_info,
      vars: {
        'NAME' => user.name,
        'SUBJECT' => 'Thanks for applying!'
      },
      important: true,
      inline_css: true
     )
  end
end