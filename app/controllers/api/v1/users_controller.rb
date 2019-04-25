class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :login]

  def create
    user = User.create!(create_params)
    render json: user
  end

  def me
    render json: current_user
  end

  def update
    current_user.update!(update_params)
    render json: :current_user
  end

  def login
    command = LoginCommand.call(login_params)

    if command.failure?
      render_unauthorized
      return
    end

    render json: {
      user: command.result.first,
      token: command.result.last,
    }
  end

  private
  def create_params
    params.require(:user).permit(:name, :email, :password)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def update_params
    params.require(:user).permit(:name, :email, :password)
  end
end
