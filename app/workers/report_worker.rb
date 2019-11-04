# TODO: Add logic for generating reports
class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'med_priority'

  def perform(start_date, end_date)
    puts "SIDEKIQ Worker Generating Report from #{start_date} to #{end_date}."
  end
end