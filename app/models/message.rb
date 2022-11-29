# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  send_to_id :integer
#  user_id    :integer
#
class Message < ApplicationRecord
  belongs_to(:user, {
    :class_name => "User",
    :foreign_key => "user_id"
  })

end
