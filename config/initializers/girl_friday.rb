#EMAIL_QUEUE = GirlFriday::WorkQueue.new(:user_email, :size => 3) do |msg|
#  UserMailer.registration_email(msg).deliver
#end
IMAGE_QUEUE = GirlFriday::WorkQueue.new(:image_crawler, :size => 2) do |msg|
  ImageCrawler.process(msg)
  
  #Sample Usage
  #EMAIL_QUEUE.push(:email => @user.email, :name => @user.name)

end