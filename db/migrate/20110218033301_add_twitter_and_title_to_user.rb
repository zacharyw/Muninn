class AddTwitterAndTitleToUser < ActiveRecord::Migration
  def self.up
  	add_column :users, :title, :string
  	add_column :users, :description, :string
  	add_column :users, :twitter, :string
  end

  def self.down
  	remove_column :users, :title
  	remove_column :users, :description
  	remove_column :users, :twitter
  end
end
