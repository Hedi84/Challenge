class ProductsController < ApplicationController

   before_action :set_product, except: [:new, :index, :create]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # this column is redundant
    @product.creation_date = DateTime.now.to_date
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
    @product.update(product_params)
    if @product.save
      redirect_to products_path
    else
      render "edit"
    end
  end

  def destroy
    @product.delete
  end

  private

  def set_product
   @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :creation_date)
  end

end

