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

  test "email validation should accept valid addresses" do
    valid_addresses = %w[USER@example.com A_US_ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do
        |email|
        @user.email = email
        assert @user.valid?, "#{email.inspect} should be valid."
      end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[USER@example,com A_US_ER_at_foo.bar.org
      user.name@example.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do
        |email|
        @user.email = email
        assert_not @user.valid?, "#{email.inspect} should be invalid."
      end
    end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    #Test passes if duplicate user is NOT valid
    assert_not duplicate_user.valid?
  end
end
