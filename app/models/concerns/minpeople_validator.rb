class MinpeopleValidator < ActiveModel::Validator
  def validate(record)
     unless record.min_participants < record.max_participants
      record.errors.add(:min_participants, "can't be more than the max")
    end
  end
end