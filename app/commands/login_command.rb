class LoginCommand
  prepend SimpleCommand

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  def call
    user = User.find_by!(email: @email)

    if user.authenticate(@password)
      return [user, encode_token(user_id: user.id)]
    end

    errors.add(:command, :invalid_credentials)
    nil
  rescue ActiveRecord::RecordNotFound
    errors.add(:command, :invalid_credentials)
    nil
  end

  private
  def encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
