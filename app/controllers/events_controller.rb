class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @events = @current.events
  end

  def new 
   @event = @current.events.new
  end

def create
  @event = @current.events.build(event_params)
  if @event.save
        redirect_to events_show_path, notice: "Event was created successfully"
    else
    render :new
  end
end

private

  def event_params
      params.require(:event).permit(:description, :event_date)
  end

end
