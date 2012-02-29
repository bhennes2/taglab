class AddDateIndex < ActiveRecord::Migration
  def self.up
  	add_index :tags, :date
  end

  def self.down
  	remove_index :tags, :date
  end
end
