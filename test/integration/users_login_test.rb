require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael) #Getting the test user from fixtures
  end
  test "login with invalid info" do
    get login_path
    assert_select 'form[action="/login"]'
    post login_path, params:{
      session:{
        email: '',
        password: ''
      }
    }
    assert_template 'sessions/new'
    assert_not flash.empty?
    assert_select 'div.alert'
    get '/'
    assert flash.empty?
    assert_select 'div.alert', false

  end

  test "login with valid info" do
    get login_path
    post login_path, params:{
      session:{
        email: @user.email,
        password: 'password'
      }
    }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select 'a[href =?]', login_path, false
    assert_select 'a[href =?]', logout_path
    assert_select 'a[href =?]', user_path(@user)
    #Logout
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select 'a[href=?]', login_path
    assert_select 'a[href =?]', logout_path, false
    assert_select 'a[href =?]', user_path(@user), false
  end
end
