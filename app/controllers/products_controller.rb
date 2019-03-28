class ProductsController < ApplicationController
  before_action :load_product, only: %w[show edit update destroy]
  before_action :load_category, only: %w[new create]

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Answer was successfully created'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product.category
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to category_path(@product.category)
  end

  private

  def load_product
    @product = Product.friendly.find(params[:id])
  end

  def load_category
    @category = Category.friendly.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :info)
  end
end
