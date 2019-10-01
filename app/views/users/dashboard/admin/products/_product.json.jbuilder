json.extract! product, :id, :name, :unit_price
json.url admin_product_url(product, format: :json)
