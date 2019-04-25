class Advisor < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :name, presence: true, uniqueness: true
  validates :algolia_app_id, presence: true
  validates :algolia_search_api_key, presence: true
  validates :algolia_index_name, presence: true
end
