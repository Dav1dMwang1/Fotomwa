require './app/controllers/users/dashboard/customers/side_nav_content'
module Users
  module Dashboard
    class CustomerDashboardController < DashboardController
      include CustomerSideNavContent
      def index
        render 'users/dashboard/customers/index', locals: {customer_content: @all_content = dashboard_content }
      end
    end
  end
end
