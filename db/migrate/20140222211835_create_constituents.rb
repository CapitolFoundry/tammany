class CreateConstituents < ActiveRecord::Migration
  def change
    create_table :constituents do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :cell
      t.string :landline
      t.string :email

      t.timestamps
    end
  end
end
