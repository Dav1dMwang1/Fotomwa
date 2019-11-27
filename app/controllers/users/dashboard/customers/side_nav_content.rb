# TODO add something unique between Order Progress and Order History
module CustomerSideNavContent
  def dashboard_content
    super +
        "
            <hr class='uk-hr uk-margin-remove'>
          <div class='uk-tile uk-tile-xsmall'>
            #{sub_section_four}
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
          <li><a href='#{customers_profile_path(current_user.id)}'>Account Details</a></li>
          <li><a href='#{edit_customers_profile_path(current_user.id)}'>Edit Account</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Settings</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{customers_settings_preferences_path}'>Preferences</a></li>
          <li><a href='#{customers_settings_payments_path}'>Payments</a></li>
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
          <li><a href='#{customers_notification_path}'><span></span>Notifications</a></li>
          </ul>
          "
  end

  def sub_section_three
    "
          <ul class='uk-nav-default  uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Photo Information</a></li>
              <li><a href='#{customers_gallery_path}'><span></span>Gallery</a></li>
          </ul>
          "
  end

  def sub_section_four
    "
          <ul class='uk-nav-default  uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Legal Information</a></li>
              <li><a href='#{customers_faqs_path}'>FAQ</a></li>
              <li><a href='#{customers_legal_path}'>Legal Agreements</a></li>
          </ul>
          "
  end
end