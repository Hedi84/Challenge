class MatchesController < ApplicationController

  before_action :set_match, only: [:destroy]
  before_action :set_product, except: [:destroy]

  def new
    @match = Match.new
    @categories = Categories.all.order(:name)
  end

  def create
    @product = Product.find(params[:product_id])
    @match = Match.new(match_params)
    @match.category = @category
    if @dose.save
     redirect_to show_path(@product)
   else
     render :new
   end
  end

  def destroy
    @match = Match.find(params[id])
    @match.destroy
    redirect to show_path(@product)
  end

  private

  def set_dose
    @match = Match.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def match_params
    params.require(:match).permit(:product_id, :category_id)
  end
end
