class AddAvatarToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :avatar, :string
  end
end
