class Event < ApplicationRecord

  belongs_to :user
  #i think should be has and belongs to many user
  belongs_to :place
  belongs_to :category
  has_many :comments
  validates :name,:place_id,:price, :starts_at, :ends_at, :min_participants, :max_participants, :description, :image, presence: true
  accepts_nested_attributes_for :place, :user, :comments

  mount_uploaders :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  #in index we want to display only the upcoming events
  scope :upcoming, -> {where("starts_at >= (?)", Time.now)}
  scope :past, -> {where("ends_at <= (?)", Time.now)}
  #scope :upcoming, -> {where("starts_at > (?) And is_published = (?)", Time.now, true)}

  #to validate that the starting date of the event is not in the past 
  validate :start_at_cannot_be_in_the_past
  def start_at_cannot_be_in_the_past
      unless !starts_at.nil? && starts_at > Time.now
        errors.add(:starts_at, "can't be in the past")
      end
  end

  validate :ends_at_cannot_before_starts_at
  def ends_at_cannot_before_starts_at
    unless !ends_at.nil? && ends_at > starts_at
      errors.add(:ends_at, "can't be before starting date ")
    end
  end


  validate :min_people_lessthan_max_people
  def min_people_lessthan_max_people
    unless min_participants < max_participants
      errors.add(:min_participants, "can't be more than the max")
    end
  end

  private

  def image_size_validation
    errors[:image] << "should be less than 2 MB" if image.size > 2.megabytes
  end

end
