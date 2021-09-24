require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should respond with json" do
    get root_path
    assert valid_json(response.body)
  end

  test "should have social media platforms" do
    get root_path
    data = JSON.parse(response.body)
    assert data.has_key?("twitter")
    assert data.has_key?("facebook")
    assert data.has_key?("instagram")
  end

  test "twitter should have username and tweet" do
    get root_path
    data = JSON.parse(response.body)
    tweet = data["twitter"].first

    if tweet
      assert tweet.has_key?("username")
      assert tweet.has_key?("tweet")
    end 
  end


 test "facebook should have name and status" do
    get root_path
    data = JSON.parse(response.body)
    status = data["facebook"].first

    if status
      assert status.has_key?("name")
      assert status.has_key?("status")
    end
  end

  test "instagram should have username and picture" do
    get root_path
    data = JSON.parse(response.body)
    photos = data["instagram"].first

    if photos
      assert photos.has_key?("username")
      assert photos.has_key?("picture")
    end
  end


  def valid_json(data)
    begin
      JSON.parse(data)
    rescue
      return false
    end
    true
  end

end