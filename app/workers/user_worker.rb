class UserWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical', retry: false

  def perform(user_id, order_params, order_products_params)
    # Do something
  end
end
