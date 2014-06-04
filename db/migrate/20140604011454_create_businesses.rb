class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :parent_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
