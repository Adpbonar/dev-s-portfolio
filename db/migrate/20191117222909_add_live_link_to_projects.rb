class AddLiveLinkToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :live_link, :string 
  end
end
