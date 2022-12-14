# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  accept     :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  send_to_id :integer
#  user_id    :integer
#
class Message < ApplicationRecord
  belongs_to(:user, {
    :class_name => "User",
    :foreign_key => "user_id"
  })

  belongs_to(:ingredient_owned, {
    :class_name => "IngredientOwned",
    :foreign_key => "item_id"
  })

end
