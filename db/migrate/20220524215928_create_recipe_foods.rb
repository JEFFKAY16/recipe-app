class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.float :quantity
      t.integer :recipe_id
      t.integer :food_id

      t.timestamps
    end

    add_foreign_key :recipe_foods, :foods, column: :food_id
    add_index :recipe_foods, :food_id

    add_foreign_key :recipe_foods, :recipes, column: :recipe_id
    add_index :recipe_foods, :recipe_id

  end
end
