class ContactUs::ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @message = contact.message
    @subject = contact.subject
    @name = contact.name
    @email = contact.email
    @headers['Reply-To'] = "'#{@name}' <#{@email}>"

    mail :from    => @email,
         :subject => (@subject) ? @subject : t('contact_us.contact_mailer.contact_email.subject', :email => @email),
         :to      => ContactUs.mailer_to
  end
  
  def thank_you_email(contact)
    @name = contact.name
    @email = contact.email
    
    mail :from    => ContactUs.mailer_to,
         :subject => t('contact_us.contact_mailer.thank_you.subject'),
         :to      => @email
  end
end
