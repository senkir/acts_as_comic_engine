class AdminUser < ActiveRecord::Base
  has_many :blogs
  has_many :posts
  has_many :comics, :through => :admin_user_comic
  has_many :admin_user_comic

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :displayname

  validates_presence_of :displayname, :email
  
  accepts_nested_attributes_for :blogs, :posts, :admin_user_comic
  
  after_create { |admin| admin.send_reset_password_instructions }
  
  def password_required?
    new_record? ? false : super
  end
end
