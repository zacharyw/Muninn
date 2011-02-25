class AddCommentsSwitchToInstall < ActiveRecord::Migration
  def self.up
  	add_column :users, :enable_comments, :boolean
  end

  def self.down
		remove_column :users, :enable_comments
  end
end
