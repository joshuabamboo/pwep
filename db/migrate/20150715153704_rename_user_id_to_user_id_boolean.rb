class RenameUserIdToUserIdBoolean < ActiveRecord::Migration
  def change
    change_column :notes, :user_id, :integer
  end
end
