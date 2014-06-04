class ChangeBusinessColumn < ActiveRecord::Migration
  def change
	rename_column :businesses, :class, :instruction
  end
end
