class RemoveBracketsFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :[]
  end
end
