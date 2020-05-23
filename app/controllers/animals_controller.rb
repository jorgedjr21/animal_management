class AnimalsController < ApplicationController
  before_action :set_person
  
  def index
  end

  def new
    @animal = @person.animals.build
  end

  def save

  end

  private
  
  def set_person
    @person = Person.find_by(id: params[:person_id])
    redirect_to people_path, flash: { alert: t('messages.not_found') } if @person.blank?
  end
end