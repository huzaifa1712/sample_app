require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    #Test passes if user.valid? returns false instead of true
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    #Name not longer than 50 characters
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    #Email not longer than 255 characters because of limitations of String
    #data type in some DBs
    @user.email = "a" *244 + "@example.com"
    assert_not @user.valid?
  end
end
