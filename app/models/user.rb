class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  ## validates :password_digest, presence: true
  has_secure_password

  has_many :friendships
  has_many :invites, foreign_key: :guest_id
  # has_many :parties, foreign_key: :host_id, class_name: "Party"
  has_many :hosted_parties, foreign_key: :host_id, class_name: 'Party'
  has_many :parties, foreign_key: :guest_id, class_name: 'Party', through: :invites
  # XX has_many :guest_parties, foreign_key: :guest_id, class_name: "Party", through: :invites

  has_many :friend_relationships, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friend_relationships, source: :friended
end

# has_many :parties, through: :invites
# belongs_to :party
