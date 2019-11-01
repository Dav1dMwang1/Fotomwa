module Frontend
  class HomepageController < FrontendController
    # TODO visit the fixed top navigation bar later, with a logo as well.
    # TODO revisit and restart the Login process with Devise (focus: Facebook and Google OAuth), use documentation and the wiki.
    require './app/workers/order_worker'
    def home
      # OrderWorker.perform_async('david', 0)
      # OrderWorker.perform_in(5.seconds, 'kariuki', 5)
    end
  end
end
