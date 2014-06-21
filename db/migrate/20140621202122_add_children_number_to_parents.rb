class AddChildrenNumberToParents < ActiveRecord::Migration
  def change
    add_column :parents, :children_number, :integer
  end
end
