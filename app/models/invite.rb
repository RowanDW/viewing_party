class Invite < ApplicationRecord
  validates :party_id, presence: true  ##?
  validates :guest_id, presence: true  ##?

  belongs_to :party
  belongs_to :guest, class_name: "User"
end
