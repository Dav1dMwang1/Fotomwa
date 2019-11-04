# TODO: Add function for adding the correct processing time
# For Seeding Data into the Database
# For Categories
def seed_category(variable, array, time_array)
  if variable.count.equal?0
    # array.each { |item| variable.create(name: "#{item}", processing_time: "#{}") }
    array.zip(time_array) do |item, time|
      variable.create(name: "#{item}", processing_time: "#{time}")
    end
  end
end

# For Brands
def seed_brand(variable, array, category, time_array)
  begin
    if variable.find_by(name: "#{category}").count.equal?0
      # array.each { |name| variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{name}", processing_time: "#{}") }
      array.zip(time_array) do |item, time|
        variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{item}", processing_time: "#{time}")
      end
    end
  rescue NoMethodError => e
    # puts e.message
    # array.each { |name| variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{name}") } if e.message.eql?("undefined method `count' for nil:NilClass")
    if e.message.eql?("undefined method `count' for nil:NilClass")
      array.zip(time_array) do |item, time|
        variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{item}", processing_time: "#{time}")
      end
    end
  end
end

# For Products
def seed_product(variable, array, brand, time_array, stock_array)
  zipped_array = time_array.zip(stock_array)
  begin
    if variable.find_by(name: "#{brand}").count.equal?0
      array.zip(zipped_array) do |np, ts|
        variable.create(brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{np[0]}", unit_price: "#{np[1]}", processing_time: "#{ts[0]}", stock: "#{ts[1]}")
      end
    end
  rescue NoMethodError => e
    array.zip(zipped_array) do |np, ts|
      variable.create(brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{np[0]}", unit_price: "#{np[1]}", processing_time: "#{ts[0]}", stock: "#{ts[1]}")
    end
  end

end

def to_minutes(hrs)
  hrs * 60
end

# Categories
seed_category(Category, %w(Frame Photos Cameras Accessories), [10, 5, 30, 5])

# Brands
# Frames
seed_brand(Brand, %w(KL11 Pata 1492 Mount), 'Frame', [7, 5, 7, to_minutes(3)])
# # Photos
seed_brand(Brand, %w(Studio Track), 'Photos', [5, 5])
# # Cameras
seed_brand(Brand, %w(Nikon Sony Canon), 'Cameras', [0, 0, 0])
# # Accessories
seed_brand(Brand, %w(Nikon Sony Canon), 'Accessories', [0, 0, 0])

# Products
# Studio Photos
studio_size = %w(Passport 4R 5R 6R 8R 8L 11R)
studio_unit_prices = [200, 250, 300, 350, 400, 600, 900]
seed_product(Product, [studio_size, studio_unit_prices], 'Studio', [5, 10, 15, 15, 35, 35, to_minutes(2)], [nil, nil, nil, nil, nil, nil, nil])
# Product.create(brand_id: "#{Brand.find_by(name: "Studio").id}", name: "Passport", unit_price: "200")
# Track Photos
track_size = studio_size
track_unit_prices = [120, 20, 50, 100, 200, 300, 750]
seed_product(Product, [track_size, track_unit_prices], 'Track', [5, 5, 5, 5, 5, 5, to_minutes(2)], [nil, nil, nil, nil, nil, nil, nil])
# Frames
# KL11
frame_size = %w(3R 4R 5R 6R 8R 8L 11R)
frame_unit_prices = [200, 450, 500, 650, 900, 1600, 1800]
seed_product(Product, [frame_size, frame_unit_prices], 'KL11', [13, 13, 13, 13, 13, 13, 13], [5, 5, 5, 5, 5, 5, 5])
# 1492
frame_size = %w(3R 4R 5R 6R 8R 8L 11R)
frame_unit_prices = [200, 500, 550, 650, 1000, 1800, 2000]
seed_product(Product, [frame_size, frame_unit_prices], '1492', [13, 13, 13, 13, 13, 13, 13], [5, 5, 5, 5, 5, 5, 5])
# Pata
frame_size = %w(3R 4R 5R 6R 8R 8L)
frame_unit_prices = [150, 180, 400, 550, 800, 900]
seed_product(Product, [frame_size, frame_unit_prices], 'Pata', [10, 10, 10, 10, 10, 10], [8, 8, 8, 8, 8, 8])

# Orders
# Order.create(user_id: 1)
# if Order.count.equal? 0
#   Order.create(user_id: 1)
# end

# Order_products
# OrderProduct.create(order_id: 1, product_id: 2, amount: 1, description:"Blue Background.", processing_time: 7200)
# if OrderProduct.count.equal? 0
#   OrderProduct.create(order_id: 1, product_id: 2, amount: 1, description:"Blue Background.", processing_time: 7200, image_url: '/home/david/Pictures/David.png')
# end
