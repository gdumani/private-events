class AttendedEventsController < ApplicationController
  def new
    @to_attend = @current.attended_events.new(request.GET)
  end

  def create
  end
end
