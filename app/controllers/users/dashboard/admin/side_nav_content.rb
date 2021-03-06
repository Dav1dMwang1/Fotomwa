module AdminSideNavContent
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
              <li class='uk-active'><a href='#'><span></span>Business Information</a></li>
          <li><a href='#{admin_orders_path}'><span></span>Orders</a></li>
          <li><a href='#{admin_sys_users_path}'><span></span>User</a></li>
          <li><a href='#'><span></span>Stock</a></li>
          </ul>
          "
  end

  def sub_section_three
    "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#'><span></span>Order Information</a></li>
          <li class='uk-parent'>
          <a href='#'><span></span>Categories</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{admin_categories_path}'>All Categories</a></li>
          <li><a href='#{new_admin_category_path}'>New Category</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Brands</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{admin_brands_path}'>All Brands</a></li>
          <li><a href='#{new_admin_brand_path}'>New Brand</a></li>
          </ul>
              </li>
          <li class='uk-parent'>
          <a href='#'><span></span>Products</a>
          <ul class='uk-nav-sub'>
          <li><a href='#{admin_products_path}'>All Products</a></li>
          <li><a href='#{new_admin_product_path}'>New Product</a></li>
          </ul>
              </li>
          </ul>
          "
  end

  def sub_section_four
    "
          <ul class='uk-nav-default uk-nav-parent-icon' data-uk-nav>
              <li class='uk-active'><a href='#{admin_order_reports_path}'><span></span>Order Reports</a></li>
          <li><a href='#{admin_reports_created_path}'><span></span>Created</a></li>
          <li><a href='#{admin_reports_studio_path}'><span></span>To be Taken</a></li>
          <li><a href='#{admin_reports_edits_path}'><span></span>In Edits</a></li>
          <li><a href='#{admin_reports_prints_path}'><span></span>Processing</a></li>
          <li><a href='#{admin_reports_complete_path}'><span></span>Complete</a></li>
          </ul>
          "
  end
end