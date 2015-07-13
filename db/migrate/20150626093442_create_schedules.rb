class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :starts_at

      t.timestamps null: false
    end
  end
end
