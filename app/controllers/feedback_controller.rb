class FeedbackController < ApplicationController
  
  
  def create
    @feedback = Feedback.new(description: feedback_params)
    @feedback.save
  end

  private
  def feedback_params
    params[:feedback] ? params[:feedback].downcase : ''
  end
end
