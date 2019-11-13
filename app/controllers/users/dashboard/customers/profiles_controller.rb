# TODO: Configure the Profiles for both the Admin and Customer
module Users
  module Dashboard
    module Customers
      class ProfilesController < UsersController
        include DashboardSideNav
        include CustomerSideNavContent

        attr_writer :all_content
        before_action :set_content
        before_action :set_user, only: :show
      end
    end
  end
end
