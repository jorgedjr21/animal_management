class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    @action = 'actions.new.person'
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
  end

  def update
  end

  def destroy
  end

  private

  def person_params
    params.require(:person).permit(:name, :document, :birthdate)
  end
end