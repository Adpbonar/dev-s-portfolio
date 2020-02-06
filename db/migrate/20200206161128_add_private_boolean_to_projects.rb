class AddPrivateBooleanToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :not_public, :boolean, :default => false
  end
end
