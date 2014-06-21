class AddGenderToChildren < ActiveRecord::Migration
  def change
    add_column :children, :gender, :string
    add_column :children, :name, :string
    add_column :children, :date_of_birth, :datetime
  end
end
