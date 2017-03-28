class EventsController < ApplicationController

before_action :require_user, only: [:create, :new, :edit,:update, :publish]

def index
  @events = Event.upcoming
  @category = Category.all
  if params[:category_id].present?
    @current_category = Category.find(params[:category_id])
    @events = @current_category.events.upcoming
  else
    @events = Event.upcoming
  end
    if params[:sort_column]
      @events = @events.order("#{params[:sort_column]} #{params[:sort_direction]}")
    end
    if params[:date].present?
      @events = Event.past
    end
  @all_events = Event.all

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
  @comments = @event.comments
    unless current_user == @event.user
    render 'show'
    flash[:error] = "You cannot edit an event you did not create"
  end
  
end

def update
  @event = Event.find(params[:id])
  @comments = @event.comments
  unless current_user == @event.user
    render 'show'
    flash[:error] = "You cannot edit an event you did not create"
  end
  if @event.update_attributes(event_params)
    @event.remove_image
    if @event.image.present?
      flash.now[:success] = "Event successfully update"
      render 'show'
    end
  end
end

def show
  @event = Event.find(params[:id])
  @comments = @event.comments
end

def show_mine
  @events= current_user.events
end 


#still not implemented
def publish
  @event = Event.find(params[:id])
  @event.update_attributes(:is_published => true)
  flash[:success] = "Event published"
  redirect_to root_path
end

private 

def event_params
  params.require(:event).permit(:name, :min_participants, :max_participants, :price, :description, :starts_at, :ends_at,:is_published, :image, :remove_image, :place_id,:category_id)
end

end
