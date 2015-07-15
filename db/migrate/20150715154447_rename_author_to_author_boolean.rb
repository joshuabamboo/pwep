class RenameAuthorToAuthorBoolean < ActiveRecord::Migration
  def change
    change_column :notes, :author, :integer
  end
end
