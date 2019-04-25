class Question < ApplicationRecord
  belongs_to :advisor

  validates :content, presence: true
  validates :algolia_facet_name, presence: true
  validates :sort_order, presence: true, uniqueness: { scope: :advisor_id }
end
