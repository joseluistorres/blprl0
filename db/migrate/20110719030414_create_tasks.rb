class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :minute_id
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :assigned_to
      t.date :due_date
      t.float :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
