class AddPreviewModeToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :preview_mode, :boolean
  end

  def self.down
    remove_column :tasks, :preview_mode
  end
end
