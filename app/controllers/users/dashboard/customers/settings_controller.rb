module Users
  module Dashboard
    module Customers
      class SettingsController < CustomerDashboardController
        def payments
          render 'users/dashboard/customers/settings/payments'
        end

        def preferences
          render 'users/dashboard/customers/settings/preferences'
        end
      end
    end
  end
end