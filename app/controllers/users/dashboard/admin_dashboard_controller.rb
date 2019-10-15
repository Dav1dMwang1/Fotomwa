require './app/controllers/users/dashboard/admin/side_nav_content'
module Users
  module Dashboard
    class AdminDashboardController < DashboardController
      before_action :set_content
      include AdminSideNavContent
      def index
        render 'users/dashboard/admin/index'
      end

      def set_content
        @all_content = dashboard_content
      end
    end
  end
end

