class MusiciansController < ApplicationController

  def index
    @musicians = Musician.all
  end

  def new
    @musician = Musician.new
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def create
    musician = Musician.new(musician_args)
    begin
      musician.save!
      flash[:notice] = "Artista #{musician.name} foi adicionado com sucesso!"
      redirect_to musicians_path
    rescue => fail
      flash[:notice] = fail
      redirect_to new_musician_path
    end
  end

  def update
    musician = Musician.find(params[:id])
    begin
      musician.update!(musician_args)
      redirect_to musicians_path, notice: "Artista #{musician.name} editado com sucesso"
    rescue
      flash[:alert] = "Algo deu errado!"
      redirect_to edit_musician_path
    end
  end

  def destroy
    musician = Musician.find(params[:id].tr(':',''))
    begin
      musician.destroy!
      flash[:status] = "O artista foi deletado com sucesso"
    rescue
      flash[:status] = "Algo deu errado"
    ensure
      redirect_to musicians_path
    end
  end

  private
  def musician_args
    params.require('musician').permit(:name)
  end
end
