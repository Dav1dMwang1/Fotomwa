$ ->
  products = $('#product_id').html()
  $('#brand_id').change ->
    brand = $('#brand_id :selected').text()
    options = $(products).filter("optgroup[label='#{brand}']").html()
    if options
      $('#product_id').html(options)
    else
      $('#product_id').empty()