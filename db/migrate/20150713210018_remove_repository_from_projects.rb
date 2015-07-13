class RemoveRepositoryFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :repository, :text
  end
end
