class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie_id]) ### ??? @movie = Movie.find(movie_params)
    @list = List.find(params[:list_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def movie_params
    params.require(:bookmark).permit(:movie_id)
  end
end
