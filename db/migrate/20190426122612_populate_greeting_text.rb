class PopulateGreetingText < ActiveRecord::Migration[5.2]
  def set_default_text(advisor)
    advisor.greeting_text ||= I18n.t('advisors.default_greeting_text')
    advisor.results_text ||= I18n.t('advisors.default_results_text')
    advisor.continue_text ||= I18n.t('advisors.default_continue_text')
    advisor.results_page_text ||= I18n.t('advisors.default_results_page_text')
    advisor.start_over_text ||= I18n.t('advisors.default_start_over_text')

    advisor.save!
  end

  def up
    Advisor.where(greeting_text: nil).find_each do |advisor|
      set_default_text(advisor)
    end
  end

  def down
  end
end
