class AddUserIdToLinks < ActiveRecord::Migration[8.0]
  def change
    add_column :links, :user_id, :integer
  end
end
