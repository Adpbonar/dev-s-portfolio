class CreateIndexDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :index_documents do |t|
      t.integer :user_id
      t.text :brand_statement
      t.text :mobile_brand_one
      t.text :mobile_brand_two
      t.timestamps
    end
  end
end
