class AddWarehouseQuantityToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :warehouseQuantity, :integer
  end
end
