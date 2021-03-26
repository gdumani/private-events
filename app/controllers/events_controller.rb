class EventsController < ApplicationController
  
  def show
    @user = User.find_by(params[:user_id])
    @event = Event.find_by(params[:id])
  end

  def new 
   @user = User.find_by(params[:user_id])
   @event = @user.events.new
  end

def create
   @user = User.find_by(params[:user_id])
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
