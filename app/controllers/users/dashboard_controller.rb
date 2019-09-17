module Users
  class DashboardController < ApplicationController
    layout 'dashboard/application'
    attr_writer :all_content
    def index
    end

    def customer_content
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

    end

    def sub_section_two

    end

    def sub_section_three

    end
  end
end
