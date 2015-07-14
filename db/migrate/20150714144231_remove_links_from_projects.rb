class RemoveLinksFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :links
  end
end
