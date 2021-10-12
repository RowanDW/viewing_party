class Friendship < ApplicationRecord
  belongs_to :user  #AS host
  belongs_to :friend, class_name: "User"
end
