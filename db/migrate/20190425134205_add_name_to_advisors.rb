class AddNameToAdvisors < ActiveRecord::Migration[5.2]
  def change
    add_column :advisors, :name, :string, null: false, unique: true
  end
end
