class StartdateValidator < ActiveModel::Validator
  def validate(record)
     unless !record.starts_at.nil? && record.starts_at > Time.now
      record.errors.add(:starts_at, "can't be in the past")
  end
end
end