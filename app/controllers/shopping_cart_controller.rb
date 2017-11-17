class ShoppingCartController < ApplicationController
  after_action :authenticate_user!
  def index
    # show whats in there
    @cart = shopping_cart
    @shopping_cart = @cart.show_cart
  end

  def create
    # add something to it
    product = Product.find(params[:product_id])
    amount = params[:amount]

    if shopping_cart.add_product(product, amount)
      # happy
    else
      # not so happy, something went wrong
    end
  end

  def destroy
    # remove something from it
  end
end
