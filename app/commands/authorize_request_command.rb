class AuthorizeRequestCommand
  prepend SimpleCommand

  def initialize(request)
    @request = request
  end

  def call
    header = @request.headers['Authorization']
    header = header.split(' ').last if header

    @decoded = decode_token(header)
    @current_user = User.find(@decoded[:user_id]) 
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
    errors.add(:command, :invalid_credentials)
    return nil
  end

  private
  def decode_token(token)
    secret_key_base = Rails.application.credentials.secret_key_base
    decoded = JWT.decode(token, secret_key_base)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
