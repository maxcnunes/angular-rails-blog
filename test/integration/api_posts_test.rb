require 'test_helper'

class ApiPostsTest < ActionDispatch::IntegrationTest
  test "get /api/posts.json" do
    get "/api/posts.json"
    assert_response :success
    assert body == Post.all.to_json
    posts = JSON.parse(response.body)
    assert posts.size == 3 # because there are three fixtures (see posts.yml)
    assert posts.any? { |s| s["title"] == posts(:tdc_2013).title }
  end

  test "get /api/posts/:id" do
    post = posts(:tdc_2013)
    get "/api/posts/#{post.id}.json"
    assert_response :success
    assert body == post.to_json
    assert JSON.parse(response.body)["title"] == post.title
  end
end