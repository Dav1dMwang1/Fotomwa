def check_count(variable, array)
  if variable.count.equal?0
    array.each { |item|
      variable.create(name: "#{item}")
    }
  end
end

def check_product(variable, array, category, brand)
  array[0].zip array[1] do |name, price|
    variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{name}", unit_price: "#{price}")
  end
end

# Categories
check_count(Category, %w(Frame Photos Cameras Accessories))

# Brands
check_count(Brand, %w(KL11 Pata 1492 Mount Studio Track))

# Products
# Studio Photos
studio_size = %w(Passport 4R 5R 6R 8R 8L 11R)
studio_unit_prices = [200, 250, 300, 350, 400, 600, 900]
check_product(Product, [studio_size, studio_unit_prices], 'Photos', 'Studio')
# Track Photos
track_size = studio_size
track_unit_prices = [120, 20, 50, 100, 200, 300, 750]
check_product(Product, [track_size, track_unit_prices], 'Photos', 'Track')
# Frames
frame_size = %w(3R 4R 5R 6R 8R 8L 11R)
frame_unit_prices = [200, 450, 500, 650, 900, 1600, 1800]
check_product(Product, [frame_size, frame_unit_prices], 'Frame', 'KL11')

# Orders
# Order.create(user_id: 1)
# if Order.count.equal? 0
#   Order.create(user_id: 1)
# end

# Order_products
# OrderProduct.create(order_id: 1, product_id: 2, amount: 1, description:"Blue Background.", processing_time: 7200, image_url: '/home/david/Pictures/David.png')
# if OrderProduct.count.equal? 0
#   OrderProduct.create(order_id: 1, product_id: 2, amount: 1, description:"Blue Background.", processing_time: 7200, image_url: '/home/david/Pictures/David.png')
# end
