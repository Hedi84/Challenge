class CategoriesController < ApplicationController

   before_action :set_category, except: [:new, :index, :create]

  def new
    @category = Category.new
  end

  def create
    # there is no create a category option, but if there would be, this would
    # show all categories after saving, if not, it would go back to new.
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render "new"
    end
  end

  def show
    # ordering products from newest to oldest
    @products = @category.products.order(created_at: :desc)

  end

  def index
    # ordering categories by name so they are easier to find
    @categories = Category.all.order(:name)

  end

  # No need to update categories at this time
  # def update
  #   @category.update(category_params)
  #   if category.save
  #     redirect_to categories_path
  #   else
  #     render "edit"
  #   end
  # end

  def destroy
    @category.delete
  end

  private

  def set_category
   @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
