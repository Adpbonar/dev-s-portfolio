class AddDraftBooleanToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :draft, :boolean, :default => false
  end
end
