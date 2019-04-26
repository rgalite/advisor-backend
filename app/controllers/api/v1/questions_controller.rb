class Api::V1::QuestionsController < ApplicationController
  def show
    render json: current_question
  end

  def update
    current_question.update!(update_params)
    render json: current_question
  end

  def destroy
    current_question.destroy!
    head :no_content
  end

  private
  def current_question
    @current_question ||= current_user.questions.find(params[:id])
  end

  def update_params
    params.require(:question).permit(
      :content,
      :algolia_facet_name,
    )
  end
end
