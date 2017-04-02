class EnddateValidator < ActiveModel::Validator
  def validate(record)
    unless !record.ends_at.nil? && record.ends_at > record.starts_at
      record.errors.add(:ends_at, "can't be before starting date ")
    end
  end
end