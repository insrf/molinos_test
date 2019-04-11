class Admin::CategoriesController < Admin::BaseAdminController
  before_action :find_category , only: %i[show edit update destroy]

  def index
    @categories = Category.order(:position)
  end

  def sort
    respond_to :json
    name = params[:param].first
    parent_name = params[:param].second
    position = params[:param].last

    category = Category.where(name: name).first
    parent_category = Category.where(name: parent_name).first
    if parent_category.present?
      category.update(parent_id: parent_category.id, position: position)
    else
      category.update(parent_id: nil, position: position)
    end
    render nothing: true
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Your category successfully created.'
      redirect_to @category
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to action: "index"
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def find_category
    @category = Category.friendly.find(params[:id])
  end
end
