class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :complete
      t.datetime :starts_at
    end
  end
end
