class Friendship < ApplicationRecord
  validates :user_id, presence: true  ##?
  validates :friend_id, presence: true  ##?
  
  belongs_to :user  #AS host
  belongs_to :friend, class_name: "User"
end
