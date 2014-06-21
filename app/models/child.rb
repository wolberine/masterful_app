class Child < ActiveRecord::Base
	belongs_to :parent
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 50 }
  	validates :parent_id, presence: true
end
