class RemoveTopics < ActiveRecord::Migration
  def self.up
  	drop_table :topics
  end

  def self.down
  	create_table :topics do |t|
      t.string :name
      t.references :post

      t.timestamps
    end
  end
end
