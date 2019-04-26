class Advisor < ApplicationRecord
  belongs_to :user
  has_many :questions

  before_validation :set_default_text, on: :create
  before_validation :set_results_page_url, on: :create

  validates :name, presence: true, uniqueness: true
  validates :algolia_app_id, presence: true
  validates :algolia_search_api_key, presence: true
  validates :algolia_index_name, presence: true
  validates :greeting_text, presence: true
  validates :results_text, presence: true
  validates :continue_text, presence: true
  validates :results_page_text, presence: true
  validates :start_over_text, presence: true
  validates :results_page_url, presence: true

  private
  def set_default_text
    self.greeting_text ||= I18n.t('advisors.default_greeting_text')
    self.results_text ||= I18n.t('advisors.default_results_text')
    self.continue_text ||= I18n.t('advisors.default_continue_text')
    self.results_page_text ||= I18n.t('advisors.default_results_page_text')
    self.start_over_text ||= I18n.t('advisors.default_start_over_text')
  end

  def set_results_page_url
    self.results_page_url ||= 'https://google.com'
  end
end
