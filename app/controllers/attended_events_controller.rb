class AttendedEventsController < ApplicationController
  def new
    session[:sel_event] = request.GET
    @to_attend = @current.attended_events.new(session[:sel_event])
  end

  def create
    @to_attend = @current.attended_events.new(session[:sel_event])
    if @to_attend.save
      redirect_to users_show_path, notice: 'Event added successfully to your attendig events list'
    else
      redirect_to events_index_path, alert: "Failed. You can't attend an event more than once"
    end
  end
end
