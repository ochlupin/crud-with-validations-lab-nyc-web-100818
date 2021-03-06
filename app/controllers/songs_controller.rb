class SongsController < ApplicationController
  # index
  def index
    @songs = Song.all
  end

  # show
  def show
    @song = Song.find(params[:id])
  end

  # new
  def new
    @song = Song.new
  end

  # edit
  def edit
    @song = Song.find(params[:id])
  end

  # create
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  # update
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end
  
  # destroy
  def destroy 
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_url
  end

  private

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
  end
end
