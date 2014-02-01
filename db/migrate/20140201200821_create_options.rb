class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :user_id
      t.string :weight

      t.timestamps
    end
  end
end
