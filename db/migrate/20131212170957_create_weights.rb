class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
    	t.belongs_to :user
      t.integer :current_weight
      t.integer :goal_weight

      t.timestamps
    end
  end
end
