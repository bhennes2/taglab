class Adddatetotags < ActiveRecord::Migration
  def self.up
  	add_column :tags, :date, :date
  end

  def self.down
  	remove_column :tags, :date, :date
  end
end
