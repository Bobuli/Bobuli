class CreateSpielbegegnungs < ActiveRecord::Migration
  def self.up
    create_table :spielbegegnungs do |t|
      t.integer :verein_heim_id
      t.integer :verein_gast_id
      t.integer :tore_heim
      t.integer :tore_gast
      t.datetime :datum
      t.string :ort

      t.timestamps
    end
  end

  def self.down
    drop_table :spielbegegnungs
  end
end
