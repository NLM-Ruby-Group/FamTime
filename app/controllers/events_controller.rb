class EventsController < ApplicationController

before_action :require_user, only: [:create, :new, :edit,:publish]


end
