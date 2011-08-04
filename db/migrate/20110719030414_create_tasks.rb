class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.text :description
      t.integer :created_by
      t.integer :assign_to
      t.date :due_date
      t.float :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
