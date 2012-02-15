class AddUseridToQuickTags < ActiveRecord::Migration
  def self.up
  	add_column :quick_tags, :user_id, :string
  end

  def self.down
  	remove_column :quick_tags, :user_id, :string
  end
end
