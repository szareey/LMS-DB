require 'byebug'
class SessionsController < ApplicationController

  def new
  end

  def create
    pp request.env["omniauth.auth"]
=begin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        flash[:alert] = "Login successful" 
        # if user.type = "Student"
        #   redirect_to :questions
        # elsif user.type = "Teacher"
        #   byebug
          redirect_to :ministry_courses
        # end
    else
      flash[:alert] = "login failed"
      render :new
    end
=end
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/', notice: "Adios!"
  end


end
