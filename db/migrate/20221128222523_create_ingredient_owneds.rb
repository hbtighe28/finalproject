class CreateIngredientOwneds < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_owneds do |t|
      t.string :item
      t.integer :user_id

      t.timestamps
    end
  end
end
