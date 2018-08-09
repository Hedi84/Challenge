class MatchesController < ApplicationController

  before_action :set_product, except: [:destroy]

  def new
    @match = Match.new
  end

  def create
    # user input through params (private method below)
    @match = Match.new(match_params)
    # the product can be accessed through the match
    @match.product = @product
    # if save go to the product show page, if not, go back to new.
    @matches = Match.all
    if @match.save
      redirect_to show_path(@product)
    else
     render "new"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    # I want to redirect to the product show after removing the match, so the
    # product should be specified
    @product = @match.product
    @match.destroy
    # go back to the product show page after removing category
    redirect_to show_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def match_params
    #since you add the category from the product show, the product_id is already
    # there
    params.require(:match).permit(:category_id)
  end
end
