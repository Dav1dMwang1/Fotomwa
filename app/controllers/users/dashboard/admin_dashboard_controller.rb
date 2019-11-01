require './app/controllers/users/dashboard/admin/side_nav_content'
module Users
  module Dashboard
    class AdminDashboardController < DashboardController
      before_action :set_content, :confirm_admin
      include AdminSideNavContent

      def index
        render 'users/dashboard/admin/index'
      end

      def confirm_admin
        # unless current_user.user_role.eql?('Administrator')
          # render unauthorized page
        # end
      end
    end
  end
end

