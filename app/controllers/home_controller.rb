class HomeController < ApplicationController
  def index
    @upcoming_events = Event.upcoming
    if @upcoming_events.nil? or @upcoming_events.empty?
      @upcoming_events = Event.all
    end
  end
end
