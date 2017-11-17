class CartItem
  attr_reader :product, :amount, :product_id
  attr_accessor :added_at, :price

  def initialize(product, amount)
    @product = product
    @amount = amount
    @product_id = product.id
    @added_at = Time.now
    @price = product.price
  end

  def to_hash
    {
      product_id: @product_id,
      amount: @amount,
      added_at: @added_at,
      price: @price
    }
  end

  def self.from_hash(item_hash)
    product = Product.where(id: item_hash["product_id"]).first
    return if product.nil?
    item=CartItem.new(product, item_hash["amount"])
    item.added_at = item_hash["added_at"]
    item.price = 100
    item
  end
end
