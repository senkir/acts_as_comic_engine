module MainHelper
    include SettingHelper
    
    def featured_comic
      @id = value_for_name('featured_comic')
      Comic.find(@id)
    end
end
