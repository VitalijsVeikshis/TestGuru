class ContactsMailer < ApplicationMailer
  default to: -> { User.admin_emails }

  def new_contact(contact)
    @contact = contact

    mail from: @contact.email,
         subject: "Message from #{@contact.name}"
  end
end
