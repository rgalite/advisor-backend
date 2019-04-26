class ChangeColumnResultsPageUrlOnAdisor < ActiveRecord::Migration[5.2]
  def up
    change_column :advisors, :results_page_url, :string, null: false
  end

  def down
  end
end
