class SocialDataService
  def self.call
    Rails.cache.fetch("social_media_data", expires_in: 5.minutes) do
      tweets   = self.get_social_data('https://takehome.io/twitter') 
      statuses = self.get_social_data('https://takehome.io/facebook') 
      photos   = self.get_social_data('https://takehome.io/instagram') 
      
      { 
        twitter: tweets, 
        facebook: statuses, 
        instagram: photos,
      }
       
    end 
  end

  private
  def self.get_social_data(url)
    response = HTTParty.get(url)
    begin
      data = JSON.parse(response.body)
    rescue
      data = []
    end
    data
  end
end