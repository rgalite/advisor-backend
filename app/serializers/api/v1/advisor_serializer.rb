class Api::V1::AdvisorSerializer < ActiveModel::Serializer
  attributes :id, :algolia_app_id, :algolia_search_api_key,
    :algolia_index_name, :name, :questions_count, :greeting_text,
    :results_text, :continue_text, :results_page_text, :start_over_text,
    :results_page_url
  attribute :created_at, if: :current_user_is_owner?
  attribute :updated_at, if: :current_user_is_owner?

  def current_user_is_owner?
    current_user.present?
  end

  def questions_count
    object.questions.size
  end
end
