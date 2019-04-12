class Admin::CategoriesController < Admin::BaseAdminController
  before_action :find_category , only: %i[show edit update destroy]

  def index
    @categories = Category.order(position: :asc)
  end

  def sort
    name = params[:param][:name]
    parent_name = params[:param][:parent_name]
    position = params[:param][:position]

    category = Category.find_by(name: name)
    parent_category = Category.find_by(name: parent_name)

    category.update_categories(parent_category, position)
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
      redirect_to [:admin, @category]
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to [:admin, @category]
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
