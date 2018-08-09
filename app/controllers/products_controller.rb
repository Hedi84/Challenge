class ProductsController < ApplicationController

   before_action :set_product, except: [:new, :index, :create]

  def new
    @product = Product.new
  end

  def create
    # a new product is created with user input (params, private method below)
    @product = Product.new(product_params)
    # if the product is created, go to the show page, if not, go back to new.
    if @product.save
      redirect_to product_path(@product)
    else
      render "new"
    end
  end

  def show

  end

  def index
    # better to have them ordered by title on product index
    @products = Product.all.order(title: :asc)
  end

  def update
    # same as new but adds the original information
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render "edit"
    end
  end

  def destroy
    @product.delete
  end

  private

  def set_product
    # find the product to show, update and destroy
   @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description)
  end

end

