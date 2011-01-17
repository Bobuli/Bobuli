class AddToreToSpielbegegnungs < ActiveRecord::Migration
  def self.up
    add_column :spielbegegnungs, :tore_heim, :integer
    add_column :spielbegegnungs, :tore_gast, :integer
  end

  def self.down
    remove_column :spielbegegnungs, :tore_gast
    remove_column :spielbegegnungs, :tore_heim
  end
end
