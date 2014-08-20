class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.integer :price
      t.datetime :created_at
      t.string :category1_name
      t.string :category2_name
      t.string :brand
      t.string :color
      t.string :target

      t.timestamps
    end
  end
end
