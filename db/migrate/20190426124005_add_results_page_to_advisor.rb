class AddResultsPageToAdvisor < ActiveRecord::Migration[5.2]
  def change
    add_column :advisors, :results_page_url, :string
  end
end
