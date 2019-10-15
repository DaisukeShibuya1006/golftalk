class AddUidToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :uid, :integer
  end
end
