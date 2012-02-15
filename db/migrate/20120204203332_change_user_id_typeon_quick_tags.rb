class ChangeUserIdTypeonQuickTags < ActiveRecord::Migration
  def self.up
  	change_column :quick_tags, :user_id, :integer
  end

  def self.down
  	change_column :quick_tags, :user_id, :string
  end
end
