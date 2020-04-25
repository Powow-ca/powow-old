# frozen_string_literal: true

class WelcomeMailer < ApplicationMailer
  default from: 'powow.help@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = "#{root_url}login"
    mail(to: @user.email, subject: 'Welcome to poWow')
  end

  def pro_welcome_email
    @user = params[:user]
    @url = "#{root_url}login"
    mail(to: @user.email, subject: 'Welcome to poWow')
  end
end
