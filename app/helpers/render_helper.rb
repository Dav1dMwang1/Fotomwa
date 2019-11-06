module RenderHelper
  def pagination_links(collection, options = {})
    options[:renderer] ||= RenderHelper::LinkRenderer
    options[:class] ||= 'uk-pagination uk-flex-center'
    options[:inner_window] ||= 2
    options[:outer_window] ||= 1
    will_paginate(collection, options)
  end

  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    def page_number(page)
      if page == current_page
        tag(:span, page, class: 'uk-active')
      else
        link(page, page, class: '', rel: rel_value(page))
      end
    end

    def gap
      text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
      %(<span class="uk-pagination">#{text}</span>)
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, 'common/back.png', 'direction-previous')
    end

    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, 'common/next.png', 'direction-next')
    end

    def previous_or_next_page(page, text, classname)
      if page
        link(ActionController::Base.helpers.image_tag("#{text}", size: '10x10'), page, class: classname)
      else
        tag(:span, ActionController::Base.helpers.image_tag("#{text}", size: '10x10'), class: classname + ' bg-dark-blue near-white')
      end
    end
  end
end