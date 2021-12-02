class PhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :caption, :string
  attribute :image, :string
  attribute :location, :string
  attribute :owner_id, :integer

  # Direct associations

  has_many   :comments

  has_many   :likes,
             resource: VoteResource

  belongs_to :owner,
             resource: UserResource

  # Indirect associations

  has_many :followers, resource: UserResource, primary_key: :owner_id do
    assign_each do |photo, users|
      users.select do |u|
        u.id.in?(photo.followers.map(&:id))
      end
    end
  end


  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:followers).where(:friend_requests => {:sender_id => value})
    end
  end
end
