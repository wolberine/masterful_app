class AddPhotoToBusiness < ActiveRecord::Migration
  def self.up
	  change_table :businesses do |t|
	    t.attachment :photo
	  end
	  def change
	    add_column :businesses, :photo_file_name
	  end	
  end

  def self.down
	drop_attached_file :businesses, :photo	
  end
end
