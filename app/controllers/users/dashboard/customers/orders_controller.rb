# TODO setup the Orders Form, then set up the android app
require './app/controllers/users/dashboard/customers/orders_modules'
require './lib/FotoQueue/foto_queue'
module Users
  module Dashboard
    module Customers
      class OrdersController < CustomerDashboardController
        before_action :set_order, only: [:show, :edit, :update, :destroy]
        include OrdersHelper, OrdersModule, FotoQueue
        attr_reader :categories_array, :brands_array, :products_array

        # GET /orders
        # GET /orders.json
        def index
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
        end

        # GET /orders/1/edit
        def edit
        end

        # POST /orders
        # POST /orders.json
        def create
          @order = Order.new(order_params)
          processing_time = processing_time(order_detail_params[:product_id])
          respond_to do |format|
            if @order.save
              order_details = order_detail_params.merge(order_id: @order.id, processing_time: processing_time).except(:images, :user_id).to_h
              process_q(current_user.id, @order.id, order_details)
              format.html { redirect_to customers_orders_path, notice: 'Order was successfully created.' }
              format.json { render :show, status: :created, location: customers_orders_path }
            else
              format.html { render :new, notice: 'Order was Unsuccessfully created.' }
              format.json { render json: order_detail.errors, status: :unprocessable_entity }
            end
          end
        end

        # def create_order_products
        #   @order_detail = OrderProduct.new(order_detail_params.merge(order_id: Order.last.id).except(:images, :user_id))
        #   respond_to do |format|
        #     if @order_detail.save
        #       format.html { redirect_to customers_orders_url, notice: 'Order was successfully created.' }
        #       format.json { render :show, status: :created, location: customers_orders_path }
        #     else
        #       format.html { render :new, notice: 'Order was Unsuccessfully created.' }
        #       format.json { render json: @order_detail.errors, status: :unprocessable_entity }
        #     end
        #   end
        # end

        # PATCH/PUT /orders/1
        # PATCH/PUT /orders/1.json
        def update
          respond_to do |format|
            if @order.update(order_params)
              format.html { redirect_to customers_orders_url, notice: 'Order was successfully updated.' }
              format.json { render :show, status: :ok, location: customers_orders_path }
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
            format.html { redirect_to customers_orders_url, notice: 'Order was successfully destroyed.' }
            format.json { head :no_content }
          end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])
          @order_details = Order.find(params[:id]).order_products
          @order_details.each do |order_detail|
            @product_details =Product.find_by(id: order_detail.product_id)
            @brand_details =Brand.find_by(id: @product_details.brand_id)
            @category_details =Category.find_by(id: @brand_details.category_id)
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        # TODO change params
        # Params for Order Products
        def order_detail_params
          params.permit(:product_id, :amount, :description, {images: []}, :remove_image, :images_cache).merge(user_id: current_user.id)
          # params.permit(:product_id, :amount, :description, {images: []}, :remove_image).merge(user_id: 1)
        end
        # Params for Orders
        def order_params
          params.require(:order).permit(:amount, :description, {images: []}, :remove_image, :images_cache, :remote_images_url).merge(user_id: current_user.id)
          # params.require(:order).permit(:amount, :description, {images: []}, :remove_image).merge(user_id: 1)
        end
      end
    end
  end
end
