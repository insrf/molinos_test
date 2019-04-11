class ProductsController < ApplicationController
  before_action :load_product, only: %w[show edit update destroy]
  before_action :load_category, only: %w[new create]

  def show
  end
  
  private

  def load_product
    @product = Product.friendly.find(params[:id])
  end

  def load_category
    @category = Category.friendly.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :info, :image)
  end
end
