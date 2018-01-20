class CreateBicycles < ActiveRecord::Migration[5.1]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :info
      t.decimal :price, :precision => 10, :scale => 2
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
