class AddDescriptionToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :description, :string
  end
end
