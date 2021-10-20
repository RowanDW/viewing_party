class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_secure_password
  has_many :friendships, dependent: :destroy
  has_many :invites, foreign_key: :guest_id, dependent: :destroy, inverse_of: :guest

  has_many :hosted_parties, foreign_key: :host_id, class_name: 'Party', dependent: :destroy, inverse_of: :host
  has_many :parties, through: :invites

  has_many :friends, through: :friendships
end
