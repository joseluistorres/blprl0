class AddStatusToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :status, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :tasks, :status
  end
end
