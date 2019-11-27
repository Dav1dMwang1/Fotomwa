module Users
  module Dashboard
    module Customers
      class PhotosController < CustomerDashboardController
        def index
          render 'users/dashboard/customers/gallery/index'
        end
      end
    end
  end
end