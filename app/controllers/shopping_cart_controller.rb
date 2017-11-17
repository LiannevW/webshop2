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
    product = (params[:format] == 'json') ? Product.find(params[:product][:product_id]) : Product.find(params[:product_id])
    # amount = params[:amount]
respond_to do |format|
    if @cart.add_product(product)
        # happy
        format.html {redirect_to root_path, notice: "Product added"}
        format.json {render json: {cart: @cart, status: :created, location: product_path(product) }}
    else
      format.html {redirect_to root_path}
      # format.json {render json: @cart.errors, status: :unprocessable_entity}# not so happy, something went wrong
      #redirect_to product_id
    end
  end
  end

  def destroy
    # remove something from it
  end
end
