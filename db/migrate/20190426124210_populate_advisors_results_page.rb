class PopulateAdvisorsResultsPage < ActiveRecord::Migration[5.2]
  def up
    Advisor.where(results_page_url: nil).update_all(results_page_url: 'https://google.com')
  end

  def down
  end
end
