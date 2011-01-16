class CreateUserTippgemeinschafts < ActiveRecord::Migration
  def self.up
    create_table :user_tippgemeinschafts do |t|
      t.integer :tippgemeinschaft_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_tippgemeinschafts
  end
end
