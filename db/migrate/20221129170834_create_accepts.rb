class CreateAccepts < ActiveRecord::Migration[6.0]
  def change
    create_table :accepts do |t|
      t.integer :user_id
      t.string :accept
      t.integer :send_to_id

      t.timestamps
    end
  end
end
