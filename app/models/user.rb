class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  validates :password_digest, presence: true
  # has_secure_password

  # has_many :friendships, :invites, :parties
  has_many :friendships
  has_many :invites
  has_many :parties
  has_many :parties, foreign_key: :host_id, class_name: "Party"

  has_many :friends, foreign_key: :friend_id, class_name: "User", through: :friendships #?

end

# has_many :parties, through: :invites
# belongs_to :party
