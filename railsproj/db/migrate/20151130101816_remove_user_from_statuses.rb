class RemoveUserFromStatuses < ActiveRecord::Migration
  def change
    remove_column :statuses, :user, :integer
  end
end
