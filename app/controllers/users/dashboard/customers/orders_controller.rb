# TODO: setup the Orders Form, then set up the android app
# TODO: Only be able to delete Orders still in progress. A fee is charged to cancel the order if it has made it past the editing or studio taken phase
# TODO: Fix the Edits Page for Mulitple Orders
module Users
  module Dashboard
    module Customers
      class OrdersController < SystemOrdersController
        include CustomerSideNavContent
        # GET /orders
        # GET /orders.json
        def index
          @orders = current_user.orders.paginate(page: params[:page], per_page: 7)
          # @orders = Order.paginate(page: params[:page], per_page: 7)
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
      end
    end
  end
end
