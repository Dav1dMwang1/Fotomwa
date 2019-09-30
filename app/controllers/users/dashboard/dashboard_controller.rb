module Users
  module Dashboard
    class DashboardController < ApplicationController
      layout 'dashboard/application'

      before_action :authenticate_user!, except: [:index]
      before_action :user_signed_in?

      attr_writer :all_content

      def index
        if current_user.user_role.eql?('Customer')
          redirect_to users_customers_path
        else
          redirect_to users_admin_path
        end
      end

      def dashboard_content
        "
      <div class='uk-tile uk-tile-xsmall'>
        #{sub_section_one}
      </div>
          <hr class='uk-hr uk-margin-remove'>
      <div class='uk-tile uk-tile-xsmall'>
        #{sub_section_two}
      </div>
          <hr class='uk-hr uk-margin-remove'>
      <div class='uk-tile uk-tile-xsmall'>
        #{sub_section_three}
      </div>
      ".html_safe
      end

      def sub_section_one
        "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Profile Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span></span>Profile</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Account</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Settings</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Personal Information</a></li>
          </ul>
              </li>
          </ul>
          "
      end

      def sub_section_two

      end

      def sub_section_three

      end
    end
  end
end
