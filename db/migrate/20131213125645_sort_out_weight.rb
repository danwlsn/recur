class SortOutWeight < ActiveRecord::Migration
  def change
  	remove_column :weights, :goal_weight
  	add_column :users, :goal_weight, :integer
  end
end
