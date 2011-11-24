class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :category_description
      t.boolean :category_status

      t.timestamps
    end
  end
end
