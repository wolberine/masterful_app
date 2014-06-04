class AddClassColumnToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :class, :string
  end
end
