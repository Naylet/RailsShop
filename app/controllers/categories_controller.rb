class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]


  # GET /categories/1
  # GET /categories/1.json
  def show
    @products = @category.products.all
    @products = @products.order("created_at desc").page(params[:page]).per(5)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
