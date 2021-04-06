class UsersController < ApplicationController
  def index; end

  def show
    @created_events = @current.events
    @attending_events = @current.attended_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
