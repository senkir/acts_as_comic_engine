class AdminUser < ActiveRecord::Base
  has_one :blog
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :displayname

  validates_presence_of :displayname
  
  accepts_nested_attributes_for :blog
  
  after_create { |admin| admin.send_reset_password_instructions }
  
  def password_required?
    new_record? ? false : super
  end
  
  after_save :create_blog
  
  def create_blog 
    @blog = self.build_blog
    @blog.save
  end
end
