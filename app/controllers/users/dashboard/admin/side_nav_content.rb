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