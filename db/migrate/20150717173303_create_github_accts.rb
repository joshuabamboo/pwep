class CreateGithubAccts < ActiveRecord::Migration
  def change
    create_table :github_accts do |t|

      t.timestamps null: false
    end
  end
end
