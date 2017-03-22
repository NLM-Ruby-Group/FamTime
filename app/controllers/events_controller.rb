class EventsController < ApplicationController

before_action :require_user, only: [:create, :new, :edit,:update, :publish]

def index
  @events = Event.upcoming
  #we will also need to display the past events as an archive
end

def new
   @event = Event.new
end

def create
  @place = Place.all
  @event = current_user.events.build(event_params)
  if @event.save
    redirect_to events_path
  else
    flash.now[:failure] = @event.errors.full_messages.to_sentence
    render 'new'
  end
end

def edit
  @event = Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  if @event.update_attributes(event_params)
    @event.remove_image
  end
end

def show
  @event = Event.find(params[:id])
end

def show_mine
  @events= current_user.events
end 

def publish
  @event = Event.find(params[:id])
  @event.update_attributes(:is_published => true)
  flash[:success] = "Event published"
  redirect_to root_path
end

private 

def event_params
  params.require(:event).permit(:name, :min_participants, :max_participants, :price, :description, :starts_at, :ends_at,:is_published, :image, :image_remove, :place_id,:category_id)
end

end
