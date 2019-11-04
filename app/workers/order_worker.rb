# TODO: Add logic for creating an order
class OrderWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(order_id, order_details)
    puts "SIDEKIQ Worker Generating Order Details With ID: #{order_id}"
    OrderProduct.create(order_id: order_details['order_id'], product_id: order_details['product_id'],
                     amount: order_details['amount'], description: order_details['description'],
                     processing_time: order_details['processing_time'])
  end
end
