class RemoveTotalDaysFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :total_days, :integer
  end
end
