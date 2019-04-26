class AddGreetingTextToAdvisors < ActiveRecord::Migration[5.2]
  def change
    add_column :advisors, :greeting_text, :string
    add_column :advisors, :results_text, :string
    add_column :advisors, :continue_text, :string
    add_column :advisors, :results_page_text, :string
    add_column :advisors, :start_over_text, :string
  end
end
