require 'byebug'
class SessionsController < ApplicationController
  skip_before_filter :is_approved
  
  def create
    user = User::Auth.auth_or_create(request.env["omniauth.auth"])
    session[:user_id] = user.id

    redirect_to :root
  end

  def destroy
      session[:user_id] = nil
      redirect_to '/', notice: "Adios!"
  end


end
