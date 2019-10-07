# frozen_string_literal: true
module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

    # You should also create an action method in this controller like this:
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        flash[:success] = 'Successful Login Through Google OAuth!'
        redirect_to '/users'
      else
        session['devise.google_data'] = request.env['omniauth.auth']
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        # redirect_to root_path
      end
    end

    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        flash[:success] = 'Successful Login Through Facebook OAuth!'
        redirect_to '/users'
      else
        session['devise.google_data'] = request.env['omniauth.auth']
        flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
        # redirect_to root_path
      end
    end

    # More info at:
    # https://github.com/plataformatec/devise#omniauth

    # GET|POST /resource/auth/twitter
    def passthru
      super
    end

    # GET|POST /user/auth/twitter/callback
    def failure
      super
      flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
      # redirect_to root_path
    end

    protected

    # The path used when OmniAuth fails
    def after_omniauth_failure_path_for(scope)
      super(scope)
    end
  end

end