class Child < ActiveRecord::Base
  	validates :parent_id, presence: true
	belongs_to :parent
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 50 }
  	#has_many :relationships, foreign_key: "parent_id", dependent: :destroy
  	#has_many :parents, through: :relationships
end
