class Party < ApplicationRecord
  validates :movie, :duration, :day, :start_time, presence: true
  validates :duration, numericality: true
  has_many :invites

  has_many :guests, foreign_key: :guest_id, class_name: "User", through: :invites #?
  belongs_to :host,foreign_key: :host_id, class_name: "User"  #?

  # has_many :users, through: :invites  #AS guests
  # belongs_to :user  #AS host

end
