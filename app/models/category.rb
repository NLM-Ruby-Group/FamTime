class Category < ApplicationRecord
validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Other']
  validates_uniqueness_of :name
#here can add more categories if needed
end
