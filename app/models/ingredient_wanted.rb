# == Schema Information
#
# Table name: ingredient_wanteds
#
#  id         :integer          not null, primary key
#  item       :string
#  location   :string
#  quantity   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class IngredientWanted < ApplicationRecord

  belongs_to(:user, {
    :class_name => "User",
    :foreign_key => "user_id"
  })
  
end
