class CreateFitnessLogs < ActiveRecord::Migration
  def change
    create_table :fitness_logs do |t|
      t.integer :user_id
      t.string :activity
      t.string :type
      t.integer :time
      t.integer :reps
      t.integer :sets
      t.integer :weight

      t.timestamps
    end
  end
end
