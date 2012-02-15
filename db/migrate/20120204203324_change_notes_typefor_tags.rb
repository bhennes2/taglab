class ChangeNotesTypeforTags < ActiveRecord::Migration
  def self.up
  	change_column :tags, :notes, :text
  end

  def self.down
  end
end
