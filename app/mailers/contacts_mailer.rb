class ContactsMailer < ActionMailer::Base
  def new_contact(contact, email)
    @contact = contact

    mail from: @contact.email,
         to: email,
         subject: "Message from #{@contact.name}"
  end
end
