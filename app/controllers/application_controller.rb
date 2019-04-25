class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  protected

  def render_error(error)
    render json: {
      error: {
        code: error,
        message: I18n.t("api.errors.#{error}")
      }
    }
  end

  def render_unprocessable_entity_response(error)
    render json: {
      error: {
        code: 'invalid_record',
        message: error.message,
        field_errors: error.record.errors.details
      }
    }, status: :unprocessable_entity
  end
end
