class AddChangefiltertagToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :changefiltertag, :integer
  end

  def self.down
    remove_column :users, :changefiltertag
  end
end
