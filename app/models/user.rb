class User < ActiveRecord::Base
    attr_accessible :name, :email, :password, :password_confirmation, :company_id, :admin
    has_secure_password
    belongs_to :company
    has_many :microposts, dependent: :destroy
    has_many :targets, dependent: :destroy
    has_many :defects, dependent: :destroy
    has_many :occurrences, dependent: :destroy
    has_many :suggestions, dependent: :destroy
    
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
    
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    def feed
        # This is preliminary. See "Following users" for the full implementation.
        Micropost.where("user_id = ?", id)
    end

    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

#AdminUser.create!(:email => 'lionel.comandini@gmail.com', :password => 'lionel1986coko', :password_confirmation => 'lionel1986coko')