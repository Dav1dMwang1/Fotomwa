class FotoJob < ApplicationJob
  queue_as :low_priority

  def perform
    puts 'Hello World.'
  end
end