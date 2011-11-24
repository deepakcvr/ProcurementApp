class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :product_name
      t.string :product_description
      t.boolean :product_status

      t.timestamps
    end
  end
end
