class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, :event_id, presence: true
end
