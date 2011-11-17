class AddAssignedNameToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :assigned_name, :string
  end

  def self.down
    remove_column :tasks, :assigned_name
  end
end
