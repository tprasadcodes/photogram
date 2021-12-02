class User < ApplicationRecord
  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :liked_photos,
             :through => :likes,
             :source => :photo

  has_many   :commented_photos,
             :through => :comments,
             :source => :photo

  has_many   :timeline,
             :through => :follows,
             :source => :photos

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :exclusion => { :in => [ "qwerty", "abcdef" ]  }

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
