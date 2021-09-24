class PagesController <  ApplicationController
  def homepage
    begin
      render json: SocialDataService.call
    rescue
      render json: {
        error: "Failed to get social media data. Try again later."
      }
    end 
  end 
end
