# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy]
  before_action :authorized, only: [:index]

  # GET /meetings
  # GET /meetings.json
  def index
    if current_user.role == User.user_roles[:client]
      @meetings = Meeting.where(user_id: current_user.id)
    elsif current_user.role == User.user_roles[:pro]
      @pro = Professional.find_by(user_id: current_user.id)
      if @pro.nil?
        nil
      else
        @meetings = Meeting.where(professional_id: @pro.id)
      end
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    if current_user.role == User.user_roles[:client]
      @meeting = Meeting.find_by(user_id: current_user.id)
    elsif current_user.role == User.user_roles[:pro]
      @meeting = Meeting.find_by(professional_id: Professional.find_by(user_id: current_user.id).id)
    end
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @meeting.professional = Professional.find(pro_params)
  end

  # GET /meetings/1/edit
  def edit; end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.name = [current_user.first_name, current_user.last_name].join(' ')
    @meeting.professional = Professional.find(pro_params)
    @meeting.user = current_user
    # TODO
    @meeting.room = "powow-#{SecureRandom.uuid}"
    @meeting.password = SecureRandom.uuid

    if @meeting.save
      # Send a meeting here
      MeetingMailer.with(
        user: current_user,
        pro: @meeting.professional,
        meeting: @meeting
      ).meeting_email.deliver_later
      MeetingMailer.with(
        user: User.find(@meeting.professional.user_id),
        pro: @meeting.professional,
        meeting: @meeting
      ).pro_meeting_email.deliver_later
      redirect_to meetings_path
    else
      redirect_to meeting_new_path
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :pro)
  end

  def pro_params
    params[:pro] || ''
  end
end
