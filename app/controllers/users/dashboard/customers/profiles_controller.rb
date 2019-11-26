# TODO: Configure the Profiles for both the Admin and Customer, a lot of dummy data is prevalent
module Users
  module Dashboard
    module Customers
      class ProfilesController < UsersController
        include DashboardSideNav
        include CustomerSideNavContent

        attr_writer :all_content
        before_action :set_content
      end
    end
  end
end
