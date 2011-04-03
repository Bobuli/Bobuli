class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :salt
      t.string :validation_key
      t.string :reset_code
      t.boolean :active
 
     

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
