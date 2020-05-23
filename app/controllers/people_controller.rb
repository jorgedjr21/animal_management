class PeopleController < ApplicationController
  before_action :set_person, except: %i[index new create]

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @action = 'actions.person.new'
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path, flash: { notice: t('messages.success') }
    else
      @action = 'actions.new.person'
      flash[:alert] = t('messages.error')
      render :new
    end
  end

  def edit
    @action = 'actions.person.edit'
  end

  def update
    if @person.update(person_params)
      redirect_to people_path, flash: { notice: t('messages.success') }
    else
      @action = 'actions.edit.person'
      flash[:alert] = t('messages.error')
      render :edit
    end
  end

  def destroy
  end

  private

  def set_person
    @person = Person.find_by(id: params[:id])
    redirect_to people_path, flash: { alert: t('messages.not_found') } if @person.blank?
  end

  def person_params
    params.require(:person).permit(:name, :document, :birthdate)
  end
end