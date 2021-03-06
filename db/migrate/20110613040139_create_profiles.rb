class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :display_name
      t.text :about
      t.integer :gender, :default => 0
      t.string :location
      t.string :website
      t.date :birthday
      t.string :locale, :default => 'en', :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
