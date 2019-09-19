class Users::SessionsController < Devise::SessionsController
  def new
  end

  def manual_create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}", notice: "Logged In!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def create
    # resource = warden.authenticate!(scope: resource_name)
    @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    # redirect_to "/users/#{session[:user_id]}"
    respond_with resource
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
