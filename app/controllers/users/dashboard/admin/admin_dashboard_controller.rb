module Users
  module Dashboard
    module Admin
      class AdminDashboardController < DashboardController
        def admin
          render 'users/dashboard/admin/admin', locals: { admin_content: @all_content = dashboard_content }
        end

        def dashboard_content
          super +
          "
            <hr class='uk-hr uk-margin-remove'>
          <div class='uk-tile uk-tile-xsmall'>
            #{sub_section_four}
          </div>
          ".html_safe
        end

        def sub_section_two
          "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Order Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span></span>Studio Photos</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Passport</a></li>
          <li><a href='#'>4R - 6R</a></li>
          <li><a href='#'>8R & 8L</a></li>
          <li><a href='#'>11R</a></li>
          <li><a href='#'>Custom</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Track Photos</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Passport</a></li>
          <li><a href='#'>4R - 6R</a></li>
          <li><a href='#'>8R & 8L</a></li>
          <li><a href='#'>11R</a></li>
          <li><a href='#'>Custom</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Products</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Frames</a></li>
          <li><a href='#'>Cameras</a></li>
          <li><a href='#'>Accessories</a></li>
          </ul>
              </li>
          <li><a href='#'><span></span>Bookings</a></li>
          </ul>
          "
        end

        def sub_section_three
          "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Awaiting</a></li>
          <li><a href='#'><span></span>To be Taken</a></li>
          <li><a href='#'><span></span>To be Printed</a></li>
          <li><a href='#'><span></span>Products</a></li>
          </ul>
          "
        end

        def sub_section_four
          "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Business Information</a></li>
          <li><a href='#'><span></span>Stock Information</a></li>
          <li><a href='#'><span></span>Staff Information</a></li>
          </ul>
          "
        end


      end
    end
  end
end

