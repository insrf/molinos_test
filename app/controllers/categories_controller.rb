class CategoriesController < ApplicationController
  before_action :find_category , only: :show

  def index
    @categories = Category.order(:position)
  end

  def show
  end

  private

  def find_category
    @category = Category.friendly.find(params[:id])
  end
end
