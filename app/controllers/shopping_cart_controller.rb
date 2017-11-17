class ShoppingCartController < ApplicationController
  after_action :authenticate_user!
  def index
    # show whats in there\
    @cart = shopping_cart
    @shopping_cart = session[:shopping_cart]
    # @cart = ShoppingCart.new(session)
    @items = @cart.show_cart
  end

  # def new
  # end

  def create
    @cart = shopping_cart

    # add something to it
    product = Product.find(params[:product_id])
    amount = params[:amount]

    if @cart.add_product(product, amount)
        # happy
        redirect_to root_path
    else
      # not so happy, something went wrong
      #redirect_to product_id
    end
  end

  def destroy
    # remove something from it
  end
end
