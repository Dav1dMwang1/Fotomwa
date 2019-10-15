# For Categories
def seed_category(variable, array)
  if variable.count.equal?0
    array.each { |item| variable.create(name: "#{item}") }
  end
end

# For Brands
def seed_brand(variable, array, category)
  begin
    if variable.find_by(name: "#{category}").count.equal?0
      array.each { |name| variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{name}") }
    end
  rescue NoMethodError => e
    # puts e.message
    array.each { |name| variable.create(category_id: "#{Category.find_by(name: "#{category}").id}", name: "#{name}") } if e.message.eql?("undefined method `count' for nil:NilClass")
  end
end

# For Products
def seed_product(variable, array, brand)
  begin
    if variable.find_by(name: "#{brand}").count.equal?0
      array[0].zip array[1] do |name, price|
        variable.create(brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{name}", unit_price: "#{price}")
      end
      # array[0].zip(array[1]).each { |name, price| variable.create(brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{name}", unit_price: "#{price}") }
    end
  rescue NoMethodError => e
    array[0].zip array[1] do |name, price|
      variable.create(brand_id: "#{Brand.find_by(name: "#{brand}").id}", name: "#{name}", unit_price: "#{price}")
    end
  end

end

# Categories
seed_category(Category, %w(Frame Photos Cameras Accessories))

# Brands
# Frames
seed_brand(Brand, %w(KL11 Pata 1492 Mount), 'Frame')
# # Photos
seed_brand(Brand, %w(Studio Track), 'Photos')
# # Cameras
seed_brand(Brand, %w(Nikon Sony Canon), 'Cameras')
# # Accessories
seed_brand(Brand, %w(Nikon Sony Canon), 'Accessories')

# Products
# Studio Photos
studio_size = %w(Passport 4R 5R 6R 8R 8L 11R)
studio_unit_prices = [200, 250, 300, 350, 400, 600, 900]
seed_product(Product, [studio_size, studio_unit_prices], 'Studio')
# Product.create(brand_id: "#{Brand.find_by(name: "Studio").id}", name: "Passport", unit_price: "200")
# Track Photos
track_size = studio_size
track_unit_prices = [120, 20, 50, 100, 200, 300, 750]
seed_product(Product, [track_size, track_unit_prices], 'Track')
# Frames
frame_size = %w(3R 4R 5R 6R 8R 8L 11R)
frame_unit_prices = [200, 450, 500, 650, 900, 1600, 1800]
seed_product(Product, [frame_size, frame_unit_prices], 'KL11')

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
