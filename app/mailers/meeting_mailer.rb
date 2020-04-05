class MeetingMailer < ApplicationMailer
  default from: 'powow.help@gmail.com'

  def meeting_email
    pro_params
    user_params
    meeting_params
    # @url  = "" potentially meeting link
    mail(to: @user.email, subject: 'Upcoming poWow Details')
  end

  def pro_meeting_email
    pro_params
    user_params
    meeting_params
    # @url = "" potentially meeting link
    mail(to: @user.email, subject: 'Upcoming poWow Details')
  end

  def pro_params
    @pro = params[:pro]
  end

  def user_params
    @user = params[:user]
  end

  def meeting_params
    @meeting = params[:meeting]
  end
end
