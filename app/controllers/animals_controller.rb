class AnimalsController < ApplicationController
  before_action :set_person
  before_action :set_animal_kinds, only: %i[new create]

  def index
  end

  def new
    @animal = @person.animals.build
  end

  def create
    @animal = @person.animals.build(animal_params)
    if @animal.save
      redirect_to person_animals_path(@person), flash: { notice: t('messages.success') }
    else
      render :new
    end
  end

  private
  
  def set_person
    @person = Person.find_by(id: params[:person_id])
    redirect_to people_path, flash: { alert: t('messages.not_found') } if @person.blank?
  end

  def set_animal_kinds
    @animal_kinds = AnimalKind.all
  end

  def animal_params
    params.require(:animal).permit(:name, :monthly_cost, :animal_kind_id)
  end
end