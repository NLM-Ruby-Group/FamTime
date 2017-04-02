class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  before_create :confirmation_token

  has_many :events
  #has_many :comments
  mount_uploader :photo, PhotoUploader


  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
