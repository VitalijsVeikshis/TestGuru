class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      send_email

      redirect_to root_path, notice: t('.success')
    else
      flash.now[:alert] = t('.alert')
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

  def send_email
    User.admin_emails.each do |email|
      ContactsMailer.new_contact(@contact, email).deliver_now
    end
  end
end
