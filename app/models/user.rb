class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  # validate the format of the email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  has_many :events,
           dependent: :destroy
  has_many :registrations,
           dependent: :destroy
  # activities will be the event that the we attend
  has_many :activities, through: :registrations, source: :event
  # has_many :comments
end
