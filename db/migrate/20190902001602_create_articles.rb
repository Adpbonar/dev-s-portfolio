class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :post
      t.text :snippet
      t.datetime :scheduled_for
      t.timestamps
    end
  end
end
