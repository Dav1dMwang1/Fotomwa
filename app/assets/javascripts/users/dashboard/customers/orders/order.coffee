$ ->
  products = $('#product_ids').html()
  $('#brand_id').change ->
    brand = $('#brand_id :selected').text()
    options = $(products).filter("optgroup[label='#{brand}']").html()
    if options
      $('#product_ids').html(options)
    else
      $('#product_ids').empty()