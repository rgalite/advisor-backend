class CreateUserCommand 
  prepend SimpleCommand

  def initialize(name:, email:, password:)
    @name = name
    @email = email
    @password = password
  end

  def call
    user = User.create!(
      name: @name,
      email: @email,
      password: @password
    )

    return user
  end
end