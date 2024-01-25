class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    @review.save
    redirect_to list_path(@list)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
