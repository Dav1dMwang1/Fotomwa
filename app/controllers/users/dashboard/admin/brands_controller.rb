# require './app/controllers/users/dashboard/custom_renderer'
# TODO: Put all Module in the lib folder
module Users
  module Dashboard
    module Admin
      class BrandsController < AdminDashboardController
        before_action :set_brand, only: [:show, :edit, :update, :destroy]
        # include CustomRenderer

        # GET /brands
        # GET /brands.json
        def index
          # @brands = Brand.all
          # @categories = Category.all
          @brands = Brand.paginate(page: params[:page], per_page: 7)
        end

        # GET /brands/1
        # GET /brands/1.json
        def show
        end

        # GET /brands/new
        def new
          @brand = Brand.new
        end

        # GET /brands/1/edit
        def edit
        end

        # POST /brands
        # POST /brands.json
        def create
          @brand = Brand.new(brand_params)

          respond_to do |format|
            if @brand.save
              format.html { redirect_to admin_brands_url, notice: 'Brand was successfully created.' }
              format.json { render :show, status: :created, location: admin_brands_path }
            else
              format.html { render :new }
              format.json { render json: @brand.errors, status: :unprocessable_entity }
            end
          end
        end

        # PATCH/PUT /brands/1
        # PATCH/PUT /brands/1.json
        def update
          respond_to do |format|
            if @brand.update(brand_params)
              format.html { redirect_to admin_brands_url, notice: 'Brand was successfully updated.' }
              format.json { render :show, status: :ok, location: admin_brands_path }
            else
              format.html { render :edit }
              format.json { render json: @brand.errors, status: :unprocessable_entity }
            end
          end
        end

        # DELETE /brands/1
        # DELETE /brands/1.json
        def destroy
          @brand.destroy
          respond_to do |format|
            format.html { redirect_to admin_brands_url, notice: 'Brand was successfully destroyed.' }
            format.json { head :no_content }
          end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_brand
          @brand = Brand.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        # TODO change params
        def brand_params
          params.require(:brand).permit(:category_id, :name)
        end
      end
    end
  end
end