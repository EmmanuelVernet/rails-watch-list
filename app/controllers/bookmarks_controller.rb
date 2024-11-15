class BookmarksController < ApplicationController
  before_action :set_list, except: [:destroy]
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  def index
    # @bookmarks = Bookmark.all
    @bookmarks = @list.bookmarks
  end

  def show
    # @bookmark = Bookmark.find(params[:id])
    @bookmark = @list.bookmarks.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.list = @list
    # @bookmark.save
    # redirect_to list_path(@list)
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @bookmark = @list.bookmarks.find(params[:id])
  end

  def update
    # @bookmark = Bookmark.find(params[:id])
    # @bookmark.update(bookmark_params)
    # redirect_to list_path(@list)
    if @bookmark.update(bookmark_params)
    redirect_to list_path(@list), notice: "Bookmark was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @list = List.find(params[:list_id])
    # @bookmark = @list.bookmarks.find(params[:id])
    # @bookmark.destroy
    # redirect_to list_path(@list), notice: "Bookmark was successfully deleted.", status: :see_other
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Bookmark was successfully deleted.", status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
