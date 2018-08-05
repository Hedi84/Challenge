class CategoryController < ApplicationController
   before_action :set_category, except: [:new, :index, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render "new"
    end
  end

  def show

  end

  def index
    @categories = Category.all(created_at: :desc)
  end

  def update
    @category.update(category_params)
    if category.save
      redirect_to categories_path
    else
      render "edit"
  end

  def destroy
    @category.delete
  end

  private

  def set_category
   @category = category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
