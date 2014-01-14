class CreateCurrentWeights < ActiveRecord::Migration
  def change
  	drop_table :current_weights
    create_table :current_weights do |t|
    	t.integer :user_id
      t.integer :weight

      t.timestamps
    end
  end
end
