class RemoveWeight < ActiveRecord::Migration
  def change
  	remove_column :users, :weight
  end
end
