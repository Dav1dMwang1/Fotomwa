require './app/controllers/users/dashboard/dashboard_side_nav'
module Users
  class DashboardController < ApplicationController
    layout 'dashboard/application'
    include DashboardSideNav

    before_action :set_content
    before_action :authenticate_user!
    before_action :user_signed_in?

    attr_writer :all_content

    # Reroutes to the correct user dashboard
    def index
      if current_user.user_role.eql?('Customer')
        redirect_to customers_path
      elsif current_user.user_role.eql?('Administrator')
        redirect_to admin_path
      else
        redirect_to root_path
      end
    end
  end
end
