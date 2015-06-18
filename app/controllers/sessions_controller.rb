class SessionsController < ApplicationController

  def new
  end

  def create
      
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        flash.now[:alert] = "Login successful"
        redirect_to :questions
    else
      flash.now[:alert] = "login failed"
      render :new
    end

  end

  def destroy
      session[:user_id] = nil
      redirect_to '/', notice: "Adios!"
  end


end
