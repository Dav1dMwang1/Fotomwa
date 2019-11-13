# TODO: change for user profile settings, add avatar for the user edit
module Users
  module Dashboard
    module Admin
      class ProfilesController < UsersController
        include DashboardSideNav
        include AdminSideNavContent

        attr_writer :all_content
        before_action :set_content
        before_action :set_user, only: :show

        # Get All Users
        def index
          @users = User.all
        end
      end
    end
  end
end
