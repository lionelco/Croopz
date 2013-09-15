class User < ActiveRecord::Base
    belongs_to :company
    has_many :microposts, dependent: :destroy
    has_many :targets, dependent: :destroy
    has_many :defects, dependent: :destroy
    has_many :occurrences, dependent: :destroy
    has_many :suggestions, dependent: :destroy
    has_many :invitations, :class_name => self.class.to_s, :as => :invited_by
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_id, :admin, :invited_by_id
  # attr_accessible :title, :body

    def feed
      Micropost.where("user_id = ?", id)
    end

    private

end
