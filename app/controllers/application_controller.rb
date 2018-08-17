class ApplicationController < ActionController::Base
  #includes SessionsHelper module in every single controller as well.
  #Available by default in all views.
  include SessionsHelper
  def hello
    render html: "Hello, world!"
  end
end
