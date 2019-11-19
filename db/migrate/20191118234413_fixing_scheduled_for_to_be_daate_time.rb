class FixingScheduledForToBeDaateTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :scheduled_for, :timestamp
    add_column :articles, :scheduled_for, :datetime
  end
end
