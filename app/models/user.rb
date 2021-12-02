class User < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

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
