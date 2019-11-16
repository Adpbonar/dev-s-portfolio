class AddUserIdToCodeSamples < ActiveRecord::Migration[6.0]
  def change
    add_column :code_samples, :user_id, :integer
  end
end
