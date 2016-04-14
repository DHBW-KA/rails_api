require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @header = {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(@user.api_key)}
  end

  test "should get index" do
    get users_url, headers: @header
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, name: @user.name } }, headers: @header
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), headers: @header
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }, headers: @header
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), headers: @header
    end

    assert_response 204
  end
end
