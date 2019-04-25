class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_error
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing_error

  before_action :authorize_request

  def authorize_request
    command = AuthorizeRequestCommand.call(request)

    if command.failure?
      render_unauthorized
      return
    end

    @current_user = command.result
  end

  protected

  def current_user
    @current_user
  end

  def render_error(error)
    render json: {
      error: {
        code: error,
        message: I18n.t("api.errors.#{error}")
      }
    }
  end

  def render_unprocessable_entity_error(error)
    render json: {
      error: {
        code: 'invalid_record',
        message: error.message,
        field_errors: error.record.errors.details
      }
    }, status: :unprocessable_entity
  end

  def render_parameter_missing_error(error)
    render json: {
      error: {
        code: 'parameter_missing',
        message: error.message,
      }
    }
  end

  def render_unauthorized
    render json: {
      error: {
        code: 'invalid_credentials',
        message: I18n.t("api.errors.invalid_credentials")
      }
    }, status: :unauthorized
  end
end
