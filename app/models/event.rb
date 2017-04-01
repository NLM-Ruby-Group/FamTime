class Event < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :category
  has_many :comments
  has_many :registrations
  # attendees are the users attending the event
  has_many :attendees, through: :registrations, source: :user

  validates :name, :place_id, :price, :starts_at, :ends_at, :min_participants, :max_participants, :description, :image, presence: true
  # moved the validators to separate files
  validates_with StartdateValidator
  validates_with EnddateValidator
  validates_with MinpeopleValidator

  accepts_nested_attributes_for :place, :user, :comments

  mount_uploaders :image, ImageUploader

  validates_processing_of :image

  after_create :ensure_owner_attends

  # in index we want to display only the upcoming events
  scope :upcoming, -> { where('starts_at >= (?)', Time.now) }
  scope :past, -> { where('ends_at <= (?)', Time.now) }
  # scope :upcoming, -> {where("starts_at > (?) And is_published = (?)", Time.now, true)}

  # we creatr of the event will be the first attendee

  protected
  #check if the user is not already attending the event
  def ensure_owner_attends
    attendees << user unless attendees.include? user
  end

  private

  def image_size_validation
    errors[:image] << 'should be less than 2 MB' if image.size > 2.megabytes
  end
end
