class CreateIngredientWanteds < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_wanteds do |t|
      t.string :item
      t.integer :user_id

      t.timestamps
    end
  end
end
