class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
