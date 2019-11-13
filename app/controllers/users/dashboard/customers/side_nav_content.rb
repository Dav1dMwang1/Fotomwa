# TODO add something unique between Order Progress and Order History
module CustomerSideNavContent
  def sub_section_one
    "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Profile Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span></span>Profile</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{customers_profile_path(current_user.id)}'>Account Details</a></li>
          <li><a href='#{edit_customers_profile_path(current_user.id)}'>Edit Account</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Settings</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Personal Information</a></li>
          <li><a href='#'>Payments Information</a></li>
          </ul>
              </li>
          </ul>
          "
  end

  def sub_section_two
    "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Service Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span class='fotomwa_icons'></span>Orders</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{customers_orders_path}'>All Orders</a></li>
          <li><a href='#{new_customers_order_path}'>Purchase Order</a></li>
          <li><a href='#{customers_orders_path}'>Order Progress</a></li>
          <li><a href='#{customers_orders_path}'>Order History</a></li>
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

  def sub_section_three
    "
          <ul class='uk-nav-default  uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Photo Information</a></li>
              <li><a href='#'><span></span>Gallery</a></li>
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
end