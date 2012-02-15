class CreateQuickTags < ActiveRecord::Migration
  def self.up
    create_table :quick_tags do |t|
      t.string :title
      t.string :category
      t.integer :location

      t.timestamps
    end
  end

  def self.down
    drop_table :quick_tags
  end
end
