# frozen_string_literal: false

# Custom validations for user model
class UserValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    __send__("validate_stage#{@record.create_stage}")
  end

  private

  def validate_stage0
    @record.errors.add(:phone_number) if Phonelib.invalid_for_country? @record.phone_number, :by
  end

  def validate_stage1
    validate_stage0
    validate_present(:name)
  end

  def validate_stage2
    validate_stage1
    validate_present(:city)
  end

  def validate_stage3
    validate_stage2
    validate_present(:email)
  end

  def validate_present(attr)
    @record.errors.add(attr, "Can't be blank") unless @record.__send__(attr).present?
  end
end
