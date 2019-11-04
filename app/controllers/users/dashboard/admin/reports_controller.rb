module Users
  module Dashboard
    module Admin
      class ReportsController < AdminDashboardController
        # TODO: Generate Report
        def index
          render 'users/dashboard/admin/reports/index'
        end

        def created
          ReportWorker.perform_async(Time.now, Time.now + 1.days)
          render text: "Request to Generate a Report added to the queue"
        end

        private
        def generate_report
          sleep 30
        end
      end
    end
  end
end