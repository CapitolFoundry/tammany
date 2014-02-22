class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.date :date
      t.string :location
      t.references :priority_level
      t.references :agency
      t.references :status
      t.references :caseworker

      t.timestamps
    end
    add_index :issues, :priority_level_id
    add_index :issues, :agency_id
    add_index :issues, :status_id
    add_index :issues, :caseworker_id
  end
end
