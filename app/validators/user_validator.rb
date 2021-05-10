# frozen_string_literal: false

# Custom validations for user model
class UserValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    __send__("validate_stage#{@record.create_stage}")
  end

  private

  def validate_stage0; end

  def validate_stage1
    existing = User.find_by_email(@record.email)
    @record.errors.add(:email, "#{@record.email} already taken") unless existing.nil? || existing.id == @record.id
  end

  def validate_stage2
    validate_stage1
    validate_present(:name)
    validate_present(:city)
    validate_present(:email)
  end

  def validate_present(attr)
    @record.errors.add(attr, 'can\'t be blank') unless @record.__send__(attr).present?
  end
end
