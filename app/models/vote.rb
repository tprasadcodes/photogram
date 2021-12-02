class Vote < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :photo_id, :uniqueness => { :scope => [:user_id], :message => "already liked" }

  validates :photo_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
