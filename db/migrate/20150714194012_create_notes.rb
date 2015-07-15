class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :author,
      t.integer, :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
