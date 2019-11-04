module FotoQueue
  def process_q(user_id, order_id, order_details)
    user = User.find_by(id: user_id)
    if user.paparazzi == true
      puts "User is a Paparazzi"
      # Create Worker for paparazzi
      # Give a High Priority/Level Queue for their orders
      # create_order(order_params, order_product_params)
      OrderWorker.set(queue: :high_priority).perform_async(order_id, order_details)
    else
      puts "User is a Normal User"
      # Create Worker for Normal user
      # Give a Medium Priority/Level Queue for their orders
      # create_order(order_params, order_product_params)
      OrderWorker.set(queue: :med_priority).perform_async(order_id, order_details)
    end
  end
end
