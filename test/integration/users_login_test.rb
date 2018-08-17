require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
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
end
