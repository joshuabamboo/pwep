class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :total_days
      t.boolean :complete?
      t.integer :user_id
    end
  end
end
