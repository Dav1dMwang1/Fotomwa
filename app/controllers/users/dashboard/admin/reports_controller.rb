module Users
  module Dashboard
    module Admin
      class ReportsController < AdminDashboardController
        # TODO: Generate Report
        def index
          @reports = scope
          render 'users/dashboard/admin/reports/index'
        end

        def created
          ReportWorker.perform_async(Time.now, Time.now + 1.days)
          render text: "Request to Generate a Report added to the queue"
        end

        def show
          @report = scope.find(params[:id])

          respond_to do |format|
            format.html
            format.pdf do
              render pdf: "Report Document No. #{@report.id}",
                     page_size: 'A4',
                     template: "users/dashboard/admin/reports/show.html.erb",
                     layout: "pdf.html",
                     orientation: "Landscape",
                     lowquality: true,
                     zoom: 1,
                     dpi: 75
            end
          end
        end

        private
        def generate_report
          sleep 30
        end

        def scope
          ::Report.all.includes(:report_items)
        end
      end
    end
  end
end