class Friendship < ApplicationRecord
  validates :user_id, presence: true  # #?
  validates :friend_id, presence: true # #?

  # belongs_to :friend, foreign_key: :user_id, class_name: 'User'
  belongs_to :friended, foreign_key: :friend_id, class_name: 'User', inverse_of: :friends
end
