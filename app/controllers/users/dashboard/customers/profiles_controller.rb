# TODO: Configure the Profiles for both the Admin and Customer
require './app/controllers/users/dashboard/customers/side_nav_content'
module Users
  module Dashboard
    module Customers
      class ProfilesController < UsersController
        layout 'dashboard/order/application'
        include CustomerSideNavContent

        def index
          render 'users/dashboard/customers/'
        end
      end
    end
  end
end
