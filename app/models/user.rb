class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  # validates :password_digest, presence: true
  has_secure_password

  has_many :friendships, dependent: :destroy
  has_many :invites, foreign_key: :guest_id, dependent: :destroy
  # has_many :parties, foreign_key: :host_id, class_name: "Party"
  has_many :hosted_parties, foreign_key: :host_id, class_name: 'Party', dependent: :destroy
  has_many :parties, foreign_key: :guest_id, class_name: 'Party', through: :invites, dependent: :destroy
  # XX has_many :guest_parties, foreign_key: :guest_id, class_name: "Party", through: :invites

  has_many :friend_relationships, class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :friend_relationships, source: :friended
end

# belongs_to :party
