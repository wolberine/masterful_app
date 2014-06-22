class Parent < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  #has_many :relationships, foreign_key: "child_id", dependent: :destroy
  #has_many :children, through: :relationships
  has_many :children, dependent: :destroy

  def Parent.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Parent.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def child?(child)
    relationships.find_by(child_id: child.id)
  end

  def follow!(child)
    relationships.create!(child_id: child.id)
  end

  private

    def create_remember_token
      self.remember_token = Parent.digest(Parent.new_remember_token)
    end
end
