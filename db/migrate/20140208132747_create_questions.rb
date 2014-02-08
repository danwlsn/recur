class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :slug
      t.string :title
      t.integer :args_a
      t.integer :args_b

      t.timestamps
    end
  end
end
