class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :when
      t.string :course
      t.integer :score
      t.integer :patting
      t.text :thoughts

      t.timestamps
    end
  end
end
