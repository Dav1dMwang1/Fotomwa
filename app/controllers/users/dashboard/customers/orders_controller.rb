# TODO setup the Orders Form, then set up the android app
require './app/controllers/users/dashboard/customers/orders_modules'
module Users
  module Dashboard
    module Customers
      class OrdersController < CustomerDashboardController
        before_action :set_order, only: [:show, :edit, :update, :destroy]
        include OrdersHelper, OrdersModule
        attr_reader :categories_array, :brands_array, :products_array

        # GET /orders
        # GET /orders.json
        def index
          @all_content = dashboard_content
          @orders = Order.all
        end

        # GET /orders/1
        # GET /orders/1.json
        def show
        end

        # GET /orders/new
        def new
          @order = Order.new
          @order_product = OrderProduct.new
          instance_factors
        end

        # GET /orders/1/edit
        def edit
        end

        # POST /orders
        # POST /orders.json
        def create
          @order = Order.new(order_params)

          respond_to do |format|
            if @order.save
              format.html { redirect_to customer_orders_url, notice: 'Order was successfully created.' }
              format.json { render :show, status: :created, location: customer_orders_path }
            else
              format.html { render :new }
              format.json { render json: @order.errors, status: :unprocessable_entity }
            end
          end
        end

        # PATCH/PUT /orders/1
        # PATCH/PUT /orders/1.json
        def update
          respond_to do |format|
            if @order.update(order_params)
              format.html { redirect_to customer_orders_url, notice: 'Order was successfully updated.' }
              format.json { render :show, status: :ok, location: customer_orders_path }
            else
              format.html { render :edit }
              format.json { render json: @order.errors, status: :unprocessable_entity }
            end
          end
        end

        # DELETE /orders/1
        # DELETE /orders/1.json
        def destroy
          @order.destroy
          respond_to do |format|
            format.html { redirect_to customer_orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
          end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])
          @order_details = Order.find(params[:id]).order_products
          @order_details.each do |order_detail|
            @brand_details =Brand.find_by(id: @product_details.brand_id)
            @product_details =Product.find_by(id: order_detail.product_id)
            @category_details =Category.find_by(id: @product_details.category_id)
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        # TODO change params
        def order_params
          params.require(:order).permit(:category, :brand, :product, :amount, :description, {images: []}, :remove_image)
        end
      end
    end
  end
end
