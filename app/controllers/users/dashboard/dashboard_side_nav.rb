module DashboardSideNav
  def set_content
    @all_content = dashboard_content
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
          <li><a href='#{admin_profile_path(current_user.id)}'>Account Details</a></li>
          <li><a href='#{edit_admin_profile_path(current_user.id)}'>Edit Account</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Settings</a>
          <ul class='uk-nav-sub'>
          <li><a href='#'>Preferences</a></li>
          </ul>
              </li>
          </ul>
          "
  end

  def sub_section_two; end

  def sub_section_three;end
end