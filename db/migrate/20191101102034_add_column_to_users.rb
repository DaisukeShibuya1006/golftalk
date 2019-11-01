class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :self_introduction, :text
    add_column :users, :average_score, :integer
  end
end
