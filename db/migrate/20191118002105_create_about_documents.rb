class CreateAboutDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :about_documents do |t|
      t.integer :user_id
      t.text :about_statement
      t.timestamps
    end
  end
end
