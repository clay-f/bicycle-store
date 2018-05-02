class AddDiscountPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discount_price, :decimal, precision: 8, scala: 2, default: 1
  end
end
