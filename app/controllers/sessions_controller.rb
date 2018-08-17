class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
  end

  def destroy
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params)
      #Log user in and redirect to show page
      redirect_to user
    else
      #Show errors
      render 'new'
    end
  end
end
