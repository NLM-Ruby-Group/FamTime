class ReviewsController < ApplicationController

def create 
  @user = current_user
  @place = Place.find(params[:place_id])
  @review = @place.reviews.create(review_params)
  redirect_to place_path(@place)
end


private
def review_params
  params.require(:review).permit(:place_id,:body,:first_name,:last_name, :rating)
end

end
