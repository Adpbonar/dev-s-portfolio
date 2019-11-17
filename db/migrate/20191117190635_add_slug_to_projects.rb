class AddSlugToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :slug, :string
    add_index :projects, :slug, unique: true
    add_column :code_samples, :slug, :string
    add_index :code_samples, :slug, unique: true
  end
end
