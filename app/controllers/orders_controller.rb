class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:order_date, :user_id)
    end

end
