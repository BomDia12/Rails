class AlbunsController < ApplicationController
  def index
    @albuns = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    album = Album.new(album_args)
    begin
      album.save!
      flash[:status] = 'Álbum criado com sucesso!'
      redirect_to albuns_path
    end
  end

  private
  def album_args
    params.require('album').permit(:name, :musicians_id)
  end
end
