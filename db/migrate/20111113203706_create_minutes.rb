class CreateMinutes < ActiveRecord::Migration
  def self.up
    create_table :minutes do |t|
      t.string :name
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :minutes
  end
end
