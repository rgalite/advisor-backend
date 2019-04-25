class CreateAdvisors < ActiveRecord::Migration[5.2]
  def change
    create_table :advisors do |t|
      t.references :user, null: false
      t.string :algolia_app_id, null: false
      t.string :algolia_search_api_key, null: false
      t.string :algolia_index_name, null: false
      t.timestamps
    end
  end
end
