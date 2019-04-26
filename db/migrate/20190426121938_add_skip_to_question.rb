class AddSkipToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :skippable, :boolean, null: false, default: false
    add_column :questions, :skip_text, :string
  end
end
