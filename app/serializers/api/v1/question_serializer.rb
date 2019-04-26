class Api::V1::QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :algolia_facet_name, :sort_order, :skippable, :skip_text
  attribute :created_at, if: :current_user_is_owner?
  attribute :updated_at, if: :current_user_is_owner?

  def current_user_is_owner?
    current_user.present?
  end
end
