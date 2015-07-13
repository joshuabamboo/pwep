class RemoveDeadlineFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :deadline, :datetime
  end
end
