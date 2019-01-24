class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :events, foreign_key: :id
  # Validations
  validates_presence_of :email, :password_digest
end
