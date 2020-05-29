class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    @musicians = Musician.all
  end

  def edit
    @album = Album.find(params[:id])
    @musicians = Musician.all
  end

  def update
    album = Album.find(params[:id])
    begin
      album.update!(album_args)
      flash[:status] = "O álbum #{album} foi editado com sucesso!"
      redirect_to albums_path
    rescue
      flash[:status] = 'Algo deu errado'
      redirect_to edit_album_path
    end
  end

  def create
    album = Album.new(album_args)
    begin
      album.save!
      flash[:notice] = "O álbum #{album} foi adicionado com sucesso"
      redirect_to albums_path
    rescue
      flash[:notice] = "Algo deu errado!"
      redirect_to new_album_path
    end
  end

  def destroy
    album = Album.find(params[:id])
    begin
      album.destroy!
      flash[:status] = 'Álbum deletado com sucesso'
    rescue
      flash[:status] = 'Algo deu errado!'
    ensure
      redirect_to albums_path
    end
  end

  private
  def album_args
    params.require('album').permit(:name, :musician_id)
  end
end
