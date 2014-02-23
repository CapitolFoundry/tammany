class AddConstituentToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :constituent_id, :integer
    add_index :issues, :constituent_id
  end
  
  def self.down
    remove_column :issues, :constituent_id
    remove_index :issues, :constituent_id
  end
end
