class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #Handle successful save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    #id passed in by default due putting :users as a resource
    @user = User.find(params[:id])
    #debugger
    #This line opens debugger console from byebug gem
    # in the terminal. Allows to access data on that page from console.
    #Stops page from running.
  end

  #Mass assignment - when an entire hash is used to assign attributes to object
  #e.g   @user = User.new(params[:user]) - params contains name,email etc

  #Problem with this is, any attributes there that should not be changed can also be
  #changed by putting it in with the hash e.g admin = true for a User object

  #So rails solves this through Strong parameters. Instead of mass assignment like above
  #using params object directly, use function like one below:

  #require - this parameter is required, if not error thrown
  #permit - these parameters are allowed. Can use permit to change which
  #parameters allowed and which are not. So if admin boolean added later,
  #e.g don't include it in permit, everything is fine.
#Link explaining mass assignment: https://code.tutsplus.com/tutorials/mass-assignment-rails-and-you--net-31695

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      #returns version of params with only the permitted attributes
    end
end
