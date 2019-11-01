class OrderWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "test worker log"
  end
end
