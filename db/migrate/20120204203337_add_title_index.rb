class AddTitleIndex < ActiveRecord::Migration
  def self.up
  	add_index :tags, :title
  end

  def self.down
  	remove_index :tags, :title
  end
end
