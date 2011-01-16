class CreateTippgemeinschafts < ActiveRecord::Migration
  def self.up
    create_table :tippgemeinschafts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tippgemeinschafts
  end
end
