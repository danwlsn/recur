class FuckWeight < ActiveRecord::Migration
  def change
  	remove_column :users, :goal_weight
  	drop_table :weights
  end
end
