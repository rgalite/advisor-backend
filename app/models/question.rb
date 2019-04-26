class Question < ApplicationRecord
  belongs_to :advisor
  before_create :set_sort_order

  validates :content, presence: true
  validates :algolia_facet_name, presence: true

  private
  def set_sort_order
    self.sort_order = advisor.questions.order(sort_order: :desc).limit(1).pluck(:sort_order).first + 1
  end
end
