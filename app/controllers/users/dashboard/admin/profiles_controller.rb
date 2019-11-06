module Users
  module Dashboard
    module Admin
      class ProfilesController < UsersController
        # Get All Users
        def index
          @users = User.all
        end
      end
    end
  end
end
