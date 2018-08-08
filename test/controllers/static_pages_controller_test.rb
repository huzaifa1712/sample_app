require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  #Title tests
  test "should get root" do
    get '/'
    assert_response :success

    assert_select "title", "Home | #{@base_title}"
    assert_select "h1", "Home"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success

    assert_select "title", "Home | #{@base_title}"
    assert_select "h1", "Home"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success

    assert_select "title", "Help | #{@base_title}"
    assert_select "h1", "Help"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success

    assert_select "title", "About | #{@base_title}"
    assert_select "h1", "About"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success

    assert_select "title", "Contact | #{@base_title}"
    assert_select "h1", "Contact"
  end
end
