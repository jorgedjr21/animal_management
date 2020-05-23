module AnimalHelper

  def animal_table_header(animal)
    return [] if animal.blank?
    
    animal.attributes.keys.reject { |k| k == 'id' || k == 'created_at' || k == 'updated_at' || k == 'person_id' }
  end
end