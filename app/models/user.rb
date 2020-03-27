class User < ApplicationRecord
    has_many :articles
    has_many :votes
    has_many :voteds, :through => :votes, source: :articles
    before_validation :record_signup, on: :create
    # before_create :record_signup
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
  
    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    has_many :posts
  
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      self.remember_token == remember_token
    end
  
    private
  
    def record_signup
      token = SecureRandom.urlsafe_base64
      crypt_token = Digest::SHA1.hexdigest token.to_s
      self.remember_token = crypt_token
    end
end
