class CreateTipps < ActiveRecord::Migration
  def self.up
    create_table :tipps do |t|
      t.integer :spielbegegnung_id
      t.integer :tippgemeinschaft_id
      t.integer :tore_heim
      t.integer :tore_gast
      t.integer :punkte
      t.string :owner

      t.timestamps
    end
  end

  def self.down
    drop_table :tipps
  end
end
