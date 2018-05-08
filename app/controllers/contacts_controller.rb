class ContactsController < ApplicationController
  def new
    @contact = Contact.new(email: current_user&.email)
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactsMailer.new_contact(@contact).deliver

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
end
