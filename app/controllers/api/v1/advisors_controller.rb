class Api::V1::AdvisorsController < ApplicationController
  def index
    render json: current_user.advisors.order(created_at: :desc)
  end

  def create
    advisor = current_user.advisors.create!(create_params)
    render json: advisor
  end

  def update
    current_advisor.update!(update_params)
    render json: current_advisor
  end

  def destroy
    current_advisor.destroy!
    head :ok
  end

  def show
    render json: current_advisor
  end

  def questions
    render json: current_advisor.questions.order(sort_order: :asc)
  end

  def create_question
    render json: current_advisor.questions.create!(create_question_params)
  end

  private
  def create_params
    params.require(:advisor).permit(
      :name,
      :algolia_app_id,
      :algolia_search_api_key,
      :algolia_index_name,
    )
  end

  def update_params
    params.require(:advisor).permit(
      :name,
      :algolia_app_id,
      :algolia_search_api_key,
      :algolia_index_name,
    )
  end

  def create_question_params
    params.require(:question).permit(
      :content,
      :algolia_facet_name,
      :sort_order
    )
  end

  def current_advisor
    @current_advisor ||= current_user.advisors.includes(:questions).find(params[:id])
  end
end
