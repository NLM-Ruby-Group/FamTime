class Place < ApplicationRecord
  #has_many:events #no event model yet
  validates :name,:address, presence: true, uniqueness: true
  validates :photo, presence: true

  has_many :events
end
