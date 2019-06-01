class OrderProductsController < InheritedResources::Base

  private

    def order_product_params
      params.require(:order_product).permit(:products_id, :orders_id, :quantity)
    end

end
