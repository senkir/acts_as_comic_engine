class AdminUser < ActiveRecord::Base
  has_many  :blogs
  has_many  :posts
  has_many  :comics, :through => :admin_user_comic, :foreign_key => 'comic_id'
  has_many  :admin_user_comic
  has_many  :owned_comics, :class_name => 'Comic', :foreign_key => 'owner_id'
  has_one   :avatar  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :displayname, :is_admin

  validates_presence_of :displayname, :email
  
  accepts_nested_attributes_for :blogs, :posts, :admin_user_comic, :owned_comics, :avatar
  
  after_create { |admin| admin.send_reset_password_instructions }
  
  before_save :build_nested_avatar
  
  def password_required?
    new_record? ? false : super
  end
  
  def build_nested_avatar
    if self.avatar == nil
      @avatar = self.build_avatar
      @avatar.save
    end
  end
  
  #returns true if the user contributes to the specified comic
  def contributes_to comic
  #  throw "method not defined for class " + comic.class.to_s if comic.class != Comic.class
  throw "undefined method when AdminUser id is not set" if self.id == nil
  throw "cannot call method for nil comic class" if comic == nil
    @contributors = comic.contributors
    if @contributors != nil
      @has_match = false
      (0..@contributors.count - 1).each do |i|
        @has_match = true if self.id == @contributors[i].id
      end
      @has_match
    else
      false
    end
  end
  
  #should return an array of comics to which the user partisipates
  def all_contributing_comics
    result = []
    Comic.all.each do |comic|
      result << comic if self.contributes_to comic
    end
    result
  end
end
