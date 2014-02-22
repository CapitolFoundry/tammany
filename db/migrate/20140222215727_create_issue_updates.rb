class CreateIssueUpdates < ActiveRecord::Migration
  def change
    create_table :issue_updates do |t|
      t.text :note
      t.references :issue

      t.timestamps
    end
    add_index :issue_updates, :issue_id
  end
end
