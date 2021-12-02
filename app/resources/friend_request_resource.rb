class FriendRequestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :recipient_id, :integer
  attribute :status, :string

  # Direct associations

  # Indirect associations

end
