require './app/controllers/users/dashboard/customers/side_nav_content'
module Users
  module Dashboard
    class CustomerDashboardController < DashboardController
      before_action :set_content
      include CustomerSideNavContent

      def index
        render 'users/dashboard/customers/index'
      end
    end
  end
end
