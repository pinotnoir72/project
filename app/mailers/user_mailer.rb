class UserMailer < ApplicationMailer
    default from: "neldah72@gmail.com.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'neldah72@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
