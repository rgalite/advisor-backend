class MakeQuestionAndAdvisorsTextRequired < ActiveRecord::Migration[5.2]
  def up
    change_column :advisors, :greeting_text, :string, null: false
    change_column :advisors, :results_text, :string, null: false
    change_column :advisors, :continue_text, :string, null: false
    change_column :advisors, :results_page_text, :string, null: false
    change_column :advisors, :start_over_text, :string, null: false
    change_column :questions, :skip_text, :string, null: false
  end

  def down; end
end
