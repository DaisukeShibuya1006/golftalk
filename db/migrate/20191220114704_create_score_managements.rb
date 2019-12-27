class CreateScoreManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :score_managements do |t|
      t.string :when
      t.string :course
      t.integer :stroke
      t.integer :patting
      t.text :thought
      t.integer :uid

      t.timestamps
    end
  end
end
