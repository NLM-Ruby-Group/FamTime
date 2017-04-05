class Place < ApplicationRecord
  #has_many:events #no event model yet
  validates :name,:address,presence: true, uniqueness: true
  validates :image,:description, presence: true

  has_many :events, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploaders :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  accepts_nested_attributes_for :reviews
  private

  def image_size_validation
    errors[:image] << "should be less than 2 MB" if image.size > 2.megabytes
  end
end
