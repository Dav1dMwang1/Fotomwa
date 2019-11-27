module Users
  module Dashboard
    module Customers
      class NotificationsController < CustomerDashboardController
        def index
          render 'users/dashboard/customers/notifications/index'
        end
      end
    end
  end
end