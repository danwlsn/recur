class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
    	t.integer :user_id
      t.string :goal
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
