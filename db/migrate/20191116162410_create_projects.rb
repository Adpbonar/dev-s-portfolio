class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :versions
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
