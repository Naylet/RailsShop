class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:order_date, :users_id)
    end

end
