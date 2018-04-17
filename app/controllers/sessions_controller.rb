class SessionsController < Devise::SessionsController
  def create
    super
    if is_flashing_format?
      set_flash_message :notice,
                        :welcome,
                        first_name: current_user.first_name,
                        last_name: current_user.last_name
    end
  end
end
