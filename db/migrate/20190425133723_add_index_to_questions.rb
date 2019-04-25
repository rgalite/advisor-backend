class AddIndexToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_index :questions, :sort_order
    add_index :questions, [:advisor_id, :sort_order], unique: true
  end
end
