class AddCominingSoonAndGitubLinkToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :coming_soon, :boolean, :default => true
    add_column :projects, :GitHub_link, :string
  end
end
