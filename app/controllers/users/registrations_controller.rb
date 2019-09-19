class Users::RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation, :current_password)
  end

  def after_sign_up_path_for(resource)
    stored_location_for(resource) || user_path
  end

  def after_inactive_sign_up_path_for(resource)
    stored_location_for(resource) || new_session_url
  end

end
