class ChangeAgeTypeforUser < ActiveRecord::Migration
  def self.up
  	#change_column :users, :age, :date
	rename_column :users, :age, :age_string
	add_column :users, :age, :date
	
	User.reset_column_information
	User.find_each { |c| c.update_attribute(:age, c.age_string) }
	remove_column :users, :age_string
  end

  def self.down
  	change_column :users, :age, :string
  end
end
