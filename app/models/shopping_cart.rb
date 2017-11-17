class ShoppingCart
  def initialize(session={})
    @session = session
    session_items = session[:shopping_cart] || []
    @cart_items = session_items.map do |item|
      CartItem.from_hash(item)
    end
  end

  def add_product(product, amount = 1)
    raise ArgumentError.new("Not a product") unless product.is_a?(Product)
    if (!@cart_items[0].nil?)

       @cart_items << CartItem.new(product, amount)
     else
       @cart_items[0] = CartItem.new(product, amount)
     end
    store!
    return true
  end

  def show_cart
    @cart_items.map do |item|
      Product.where(id: item.product_id).first
    end
  end

  def remove_product(product, amount = 1)

    @cart_items.reject! do |item|
      item.product.id == product.id
    end
      @cart_items
        
        store!
  end

  def already_ordered?(product)
    @cart_items.map(&:product).map(&:id).include?(product.id)
  end

  def update_item
    return false unless already_ordered?(product)

    @cart_items.each do |item|
      if item.product.id == product.id
        item.atom += amount
      end
    end

    store!

    return true
  end

  def store!

    @session[:shopping_cart] = @cart_items.map do |item|
      # next if item.nil?
      item.to_hash
    end

  end
end
