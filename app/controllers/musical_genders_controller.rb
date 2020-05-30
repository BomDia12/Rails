class MusicalGendersController < ApplicationController
  def index
    @musical_genders = MusicalGender.all
  end

  def new
    @musical_gender = MusicalGender.new
  end

  def edit
    @musical_gender = MusicalGender.find(params[:id])
  end

  def update
    gender = MusicalGender.find(params[:id])
    begin
      gender.update!(gender_args)
      flash[:status] = "O gênero foi editado com sucesso!"
      redirect_to musical_genders_path
    rescue
      flash[:status] = 'Algo deu errado :('
      redirect_to edit_musical_gender_path
    end
  end

  def create
    gender = MusicalGender.new(gender_args)
    begin
      gender.save!
      flash[:status] = "O gênero #{gender} foi adicionado com sucesso!"
      redirect_to musical_genders_path
    rescue
      flash[:status] = "Algo deu errado!"
      redirect_to new_musical_gender_path
    end
  end

  def destroy
    gender = MusicalGender.find(params[:id])
    begin
      gender.destroy!
      flash[:status] = "O genro musical #{gender} foi retirado com sucesso"
    rescue
      flash[:status] = 'Algo deu errado'
    ensure
      redirect_to musical_genders_path
    end
  end

  private
  def gender_args
    params.require('musical_gender').permit(:name)
  end
end
