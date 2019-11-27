module Users
  class LegalsController < DashboardController
    def index
      @legals = scope
      render 'users/legals/index'
    end

    def show
      @legal = scope.find(params[:id])

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "Legal Document No. #{@legal.id}",
                 page_size: 'A4',
                 template: "users/legals/show.html.erb",
                 layout: "pdf.html",
                 orientation: "Landscape",
                 lowquality: true,
                 zoom: 1,
                 dpi: 75
        end
      end
    end

    private
    def scope
      ::Legal.all.includes(:legal_items)
    end
  end
end