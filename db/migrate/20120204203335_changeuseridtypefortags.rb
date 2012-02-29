class Changeuseridtypefortags < ActiveRecord::Migration
  def self.up
  	change_column :tags, :user_id, :integer
  end

  def self.down
  	change_column :tags, :user_id, :string
  end
end
