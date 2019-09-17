class Users::OmniauthController < Devise::OmniauthCallbacksController
  # include ActionController::Helpers
  # include ActionController::Flash

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      flash[:success] = 'Successful Login Through Facebook OAuth!'
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      # set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      flash[:success] = 'Successful Login Through Google OAuth!'
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to root_path
  end
end
