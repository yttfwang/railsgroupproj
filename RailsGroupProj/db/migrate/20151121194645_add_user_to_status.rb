class AddUserToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :User, :integer
  end
end
