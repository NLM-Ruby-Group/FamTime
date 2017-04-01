class RegistrationsController < ApplicationController

before_action :require_user

def create
  @registration = current_user.registrations.build(event_id: params[:event_id], user_id: params[:user_id])
  if @registration.save
    flash.now[:success] = "registered"
    redirect_to events_path
  else
    flash.now[:error] ='cannot register'
    redirect_to events_path
    end
end

def destroy
  @registration = Registration.find(params[:id])
  @registration.destroy
  flash[:error] = 'deleted registration'
  redirect_to events_path
end




end
