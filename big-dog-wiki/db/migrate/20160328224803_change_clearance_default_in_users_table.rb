class ChangeClearanceDefaultInUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :clearance, :string, :default => "editor"
  end
end
