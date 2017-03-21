class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  has_and_belongs_to_many :events
   has_many :comments
end
