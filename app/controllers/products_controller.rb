class ProductsController < ApplicationController

   before_action :set_product, except: [:new, :index, :create]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render "new"
    end
  end

  def show

  end

  def index
    @products = Product.all(created_at: :desc)
  end

  def update
    @product.update(product_params)
    if product.save
      redirect_to products_path
    else
      render "edit"
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

