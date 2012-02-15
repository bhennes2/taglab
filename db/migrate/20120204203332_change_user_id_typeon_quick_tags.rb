class ChangeUserIdTypeonQuickTags < ActiveRecord::Migration
  def self.up
  	#change_column :quick_tags, :user_id, :integer
		
	rename_column :quick_tags, :user_id, :user_id_string
	add_column :quick_tags, :user_id, :integer
	
	QuickTag.reset_column_information
	QuickTag.find_each { |c| c.update_attribute(:user_id, c.user_id_string) }
	remove_column :quick_tags, :user_id_string
  end

  def self.down
  	change_column :quick_tags, :user_id, :string
  end
end
