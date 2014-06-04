class Business < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :instruction, presence: true, length: { maximum: 50 }
  validates :address, presence: true	
  default_scope -> { order('created_at DESC') }
  geocoded_by :address
  after_validation :geocode
  
  has_attached_file :photo #only thing truly needed. below is for production env.
  
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  #

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    #MenuItem.where("business_id = ?", id)
  end

end
