class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :send_to_id
      t.text :message
      t.integer :item_id
      t.string :accept

      t.timestamps
    end
  end
end
