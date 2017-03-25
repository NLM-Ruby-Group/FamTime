class CommentsController < ApplicationController

def create 
  @user = current_user
  @event = Event.find(params[:event_id])
  @comment = @event.comments.create(comment_params)
  redirect_to event_path(@event)
end


private
def comment_params
  params.require(:comment).permit(:event_id,:body,:first_name,:last_name)
end

end
