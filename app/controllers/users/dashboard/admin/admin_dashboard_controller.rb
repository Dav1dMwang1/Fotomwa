module Users
  module Dashboard
    module Admin
      class AdminDashboardController < DashboardController
        def admin
          render 'users/dashboard/admin/admin'
        end
      end
    end
  end
end

