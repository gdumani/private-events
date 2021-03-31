class EventsController < ApplicationController
  def index
    @events=Event.all
  end

  def show
    @user = User.find_by(id: session[:user_id])
#    @event = User.Event.find_by(creator: @user.id])
    @events = @user.events
  end

  def new 
   @user = User.find_by(id: session[:user_id])
   @event = @user.events.new
  end

def create
  #  @user = User.find_by(params[:user_id])
  @user = User.find_by(id: session[:user_id])
  @event = @user.events.build(event_params)
    if @event.save
        redirect_to events_show_path, notice: "Event was created successfully"
    else
    render :new
  end
end

private

  def event_params
      params.require(:event).permit(:description)
  end

end
