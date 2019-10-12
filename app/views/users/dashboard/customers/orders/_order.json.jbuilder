json.extract! order, [ :id, :name ]
json.url users_customer_order_url(order, format: :json)
