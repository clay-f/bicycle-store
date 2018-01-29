class AddIdentifyIdToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :identify_id, :string
  end
end
