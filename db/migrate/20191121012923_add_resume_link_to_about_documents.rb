class AddResumeLinkToAboutDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :about_documents, :resume_link, :string
  end
end
