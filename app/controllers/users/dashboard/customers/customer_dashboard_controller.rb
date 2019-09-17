module Users
  module Dashboard
    module Customers
      class CustomerDashboardController < DashboardController
        def customer
          @all_content = customer_content
          render 'users/dashboard/customers/customer', locals: {customer_content: @all_content}
        end

        def sub_section_two
           "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Service Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span class='fotomwa_icons'></span>Orders</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Purchase Order</a></li>
          <li><a href='#'>Order Progress</a></li>
          <li><a href='#'>Order History</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Notifications</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Contact Staff</a></li>
          <li><a href='#'>Recent Order Updates</a></li>
          </ul>
              </li>
          </ul>
          "
        end

        def sub_section_one
          "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Profile Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span></span>Profile</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Account</a></li>
          <li><a href='#'>Security</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Settings</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Personal Information</a></li>
          <li><a href='#'>Payments Information</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Help</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>FAQ</a></li>
          <li><a href='#'>Legal Agreements</a></li>
          </ul>
              </li>
          </ul>
          "
        end

        def sub_section_three
          "
          <ul class='uk-nav-default' data-uk-nav>
              <li><a href='#'><span></span>Log Out</a></li>
          </ul>
          "
        end
      end
    end
  end
end
