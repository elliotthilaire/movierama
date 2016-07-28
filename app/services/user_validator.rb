class UserValidator
  def initialize(user)
    @user = user
    @errors = nil
  end

  def valid?
    errors.empty?
  end

  def errors
    return @errors if @errors
    @errors = {}

    unless _blank_email? || _valid_email?
      @errors[:email] = true
    end

    @errors
  end

  def class_for(field)
    errors[field] ? "has-error" : ""
  end

  private

  def _blank_email?
    @user.email.blank?
  end

  def _valid_email?
    @user.email.include?('@')
  end
end
