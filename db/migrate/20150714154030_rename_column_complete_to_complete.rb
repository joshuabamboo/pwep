class RenameColumnCompleteToComplete < ActiveRecord::Migration
  def change
    rename_column :projects, :complete?, :complete
  end
end
