class AddDatetoTags < ActiveRecord::Migration
  def self.up
  	add_column :tags, :date, :string
  end

  def self.down
  	remove_column :tags, :date, :string
  end
end
