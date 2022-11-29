# == Schema Information
#
# Table name: bookmarks
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  ingredient_owned_id  :integer
#  ingredient_wanted_id :integer
#  user_id              :integer
#
class Bookmark < ApplicationRecord
end
