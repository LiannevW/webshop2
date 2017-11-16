require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it "is invalid without a name" do
        product = Product.new(name: "")
        product.valid?
        expect(product.errors).to have_key(:name)
    end
  end
end
