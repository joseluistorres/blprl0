class CreateLabelsTasks < ActiveRecord::Migration
  def self.up
    create_table :labels_tasks do |t|
      t.integer :task_id
      t.integer :label_id

      t.timestamps
    end
  end

  def self.down
    drop_table :labels_tasks
  end
end
