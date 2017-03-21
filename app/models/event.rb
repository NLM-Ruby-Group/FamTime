class Event < ApplicationRecord
  has_and_belongs_to_many :user
  belongs_to :place
  belongs_to :category
  has_many :comments
end
