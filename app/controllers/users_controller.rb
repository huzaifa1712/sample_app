class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    #id passed in by default due putting :users as a resource
    @user = User.find(params[:id])
    #debugger
    #This line opens debugger console from byebug gem
    # in the terminal. Allows to access data on that page from console.
    #Stops page from running.
  end
end
