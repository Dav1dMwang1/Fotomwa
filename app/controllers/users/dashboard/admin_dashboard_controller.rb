require './app/controllers/users/dashboard/admin/side_nav_content'
module Users
  module Dashboard
    class AdminDashboardController < DashboardController
      include AdminSideNavContent
      def index
        render 'users/dashboard/admin/index', locals: {admin_content: @all_content = dashboard_content }
      end
    end
  end
end

