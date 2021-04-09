class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(request.GET)
  end

  def new
    @event = @current.events.new
  end

  def create
    @event = @current.events.build(event_params)
    if @event.event_date < Time.now
      redirect_to events_new_path, alert: 'Invalid date!!!'
    elsif @event.save
      redirect_to users_show_path, notice: 'Event was created successfully'
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :event_date)
  end
end
