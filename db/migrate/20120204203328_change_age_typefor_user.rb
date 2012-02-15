class ChangeAgeTypeforUser < ActiveRecord::Migration
  def self.up
  	change_column :users, :age, :date
  end

  def self.down
  	change_column :users, :age, :string
  end
end
