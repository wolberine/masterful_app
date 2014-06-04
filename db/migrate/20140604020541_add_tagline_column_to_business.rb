class AddTaglineColumnToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :tagline, :string
  end
end
