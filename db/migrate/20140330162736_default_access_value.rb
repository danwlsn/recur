class DefaultAccessValue < ActiveRecord::Migration
  def change
  	change_column :users, :access, :integer, :null => false, :default => 0
  end
end
