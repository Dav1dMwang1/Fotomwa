# frozen_string_literal: true
module Users
  class ConfirmationsController < Devise::ConfirmationsController
    layout 'dashboard/order/application'
    # GET /resource/confirmation/new
    def new
      super
    end

    # POST /resource/confirmation
    def create
      super
    end

    # GET /resource/confirmation?confirmation_token=abcdef
    def show
      super
    end

    protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      super(resource_name)
    end

    # The path used after confirmation.
    # TODO: Go to Edit Profiles Page to edit Profile Details
    def after_confirmation_path_for(resource_name, resource)
      token = resource.send(:set_reset_password_token)
      edit_password_url(resource, reset_password_token: token)
      sign_in(resource)
      redirect_to '/users'
      # super(resource_name, resource)
    end
  end

end