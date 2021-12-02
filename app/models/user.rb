class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

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
