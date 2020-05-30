class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
    @albums = Album.all
    @genders = MusicalGender.all
  end

  def edit
    @song = Song.find(params[:id])
    @albums = Album.all
    @genders = MusicalGender.all
  end

  def create
    song = Song.new(song_args)
    begin
      song.save!
      flash[:status] = "A música #{song} foi adicionada com sucesso"
      redirect_to songs_path
    rescue
      flash[:status] = 'Algo deu errado'
      redirect_to new_song_path
    end
  end

  def update
    song = Song.find(params[:id])
    begin
      song.update!(song_args)
      flash[:status] = "A música #{song} foi editada com sucesso"
      redirect_to songs_path
    rescue
      flash[:status] = 'Algo deu errado'
      redirect_to edit_song_path
    end
  end

  def destroy
    song = Song.find(params[:id])
    begin
      song.destroy!
      flash[:status] = 'Música deletada com sucesso!'
    rescue
      flash[:status] = 'Algo deu errado :('
    ensure
      redirect_to songs_path
    end
  end

  private
  def song_args
    params.require('song').permit(:name, :explicit, :album_id, :musical_gender_id)
  end
end
