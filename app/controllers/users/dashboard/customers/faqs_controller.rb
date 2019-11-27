module Users
  module Dashboard
    module Customers
      class FaqsController < CustomerDashboardController
        def index
          render 'users/dashboard/customers/faqs/index'
        end
      end
    end
  end
end