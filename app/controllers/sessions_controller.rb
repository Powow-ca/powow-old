# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    puts 'in Session controller'
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      puts 'User found!'
      session[:user_id] = user.id
      redirect_to(root_url)
    else
      flash.now[:alert] = 'Email or password invalid!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_url)
  end
end
