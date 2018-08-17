class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if !!(user && user.authenticate(params[:session][:password]))
      #Log user in and redirect to show page
      redirect_to user
    else
      #Show errors
      #without flash.now, the flash message pertains for one more request because render
      # is not considered a request like redirect_to
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy

  end
end
