class CreateCodeSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :code_samples do |t|
      t.string :title
      t.string :versions
      t.text :description
      t.text :code
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
