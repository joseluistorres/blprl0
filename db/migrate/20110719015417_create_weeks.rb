class CreateWeeks < ActiveRecord::Migration
  def self.up
    create_table :weeks do |t|
      t.date :start_date
      t.date :end_date
      t.integer :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :weeks
  end
end
