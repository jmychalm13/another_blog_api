require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/posts.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Post.count, data.length
  end

  test "create" do
    assert_difference "Post.count", 1 do
      user = User.create(email: "jane@test.com", password: "password", password_confirmation: "password")
      jwt = JWT.encode(
        {
          user_id: user.id,
          exp: 24.hours.from_now.to_i
        },
        Rails.application.credentials.fetch(:secret_key_base),
        "HS256"
      )
      post "/posts.json",
      headers: { "Authorization" => "Bearer #{jwt}" },
      params: {title: "Test", content: "This is yet another test", user_id: user.id}

      assert_response 200
    end
  end
end
