class AddDescImagesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :desc_images, :string
  end
end
