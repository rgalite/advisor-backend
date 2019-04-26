class Question < ApplicationRecord
  belongs_to :advisor

  before_create :set_sort_order
  before_validation :set_skip_text, on: :create

  validates :content, presence: true
  validates :algolia_facet_name, presence: true
  validates :skip_text, presence: true, on: :update

  private
  def set_sort_order
    self.sort_order = (advisor.questions.order(sort_order: :desc).limit(1).pluck(:sort_order).first || 0) + 1
  end

  def set_skip_text
    self.skip_text ||= I18n.t('questions.default_skip_text')
  end
end
