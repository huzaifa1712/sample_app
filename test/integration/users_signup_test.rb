require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "valid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do
      post signup_path, params:{
        user:{
          name: "Valid Name",
          email: "user@valid.com",
          password: "validpassword",
          password_confirmation: "validpassword"
        }
      }
    end
    follow_redirect! #follow the redirect to show user
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: {
        user:{
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation ul li', 4
    assert_select 'div.alert'
  end
end
