class Place < ApplicationRecord
  #has_many:events #no event model yet
  validates :name,:address,:description,presence: true, uniqueness: true
  validates :image, presence: true

  has_many :events

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  private

  def image_size_validation
    errors[:image] << "should be less than 2 MB" if image.size > 2.megabytes
  end
end
