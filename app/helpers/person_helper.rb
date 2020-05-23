module PersonHelper

  def table_header_keys(person)
    return [] if person.blank?
    
    person.attributes.keys.reject { |k| k == 'id' || k == 'created_at' || k == 'updated_at' }
  end
end