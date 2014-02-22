class CreatePriorityLevels < ActiveRecord::Migration
  def change
    create_table :priority_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
