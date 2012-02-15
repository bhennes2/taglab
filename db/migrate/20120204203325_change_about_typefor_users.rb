class ChangeAboutTypeforUsers < ActiveRecord::Migration
  def self.up  
  	change_column :users, :about, :text
  end
  def self.down
  
  end

  end
