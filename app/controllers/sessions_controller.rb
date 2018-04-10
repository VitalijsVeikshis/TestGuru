class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:return_to]
    else
      flash.now[:alert] = helpers.alert_message(:login)
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def sign_out
    self.current_user = nil
    session.delete(:user_id)
  end
end
