class ChangeUserIdTypeonTags < ActiveRecord::Migration
  def self.up
  	#change_column :tags, :user_id, :integer
	rename_column :tags, :user_id, :user_id_string
	add_column :tags, :user_id, :integer
	
	Tag.reset_column_information
	Tag.find_each { |c| c.update_attribute(:user_id, c.user_id_string) }
	remove_column :tags, :user_id_string
  end

  def self.down
  	change_column :tags, :user_id, :string
  end
end
