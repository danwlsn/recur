class AdminColoumn < ActiveRecord::Migration
  def change
		add_column :users, :access, :integer
  end
end
