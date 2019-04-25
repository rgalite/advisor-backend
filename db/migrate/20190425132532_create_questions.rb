class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :advisor, null: false
      t.string :content, null: false
      t.string :algolia_facet_name, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
