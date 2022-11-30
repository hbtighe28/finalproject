# == Schema Information
#
# Table name: ingredient_owneds
#
#  id         :integer          not null, primary key
#  item       :string
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class IngredientOwned < ApplicationRecord

  belongs_to(:user, {
    :class_name => "User",
    :foreign_key => "user_id"
  })
  
end
