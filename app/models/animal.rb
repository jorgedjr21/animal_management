class Animal < ApplicationRecord
  belongs_to :animal_kind
  belongs_to :owner, :foreign_key => 'person_id', class_name: 'Person'

  validates :name, presence: true, allow_blank: false
  validates :monthly_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :animal_kind_id, presence: :true
  validate :owner_age_for_andorinhas
  validate :owner_name_for_cat

  def owner_age_for_andorinhas
    age = (Date.today - owner.birthdate).to_i / 365
    errors.add(:animal_kind_id, I18n.t('activerecord.errors.models.animal.attributes.animal_kind_id.underage', kind: animal_kind.name)) if age <= 18 && animal_kind.name == 'Andorinha'
  end

  def owner_name_for_cat
    errors.add('animal_kind_id', I18n.t('activerecord.errors.models.animal.attributes.animal_kind_id.owner_name', kind: animal_kind.name)) if animal_kind.name == 'Gato' && owner.name.downcase.starts_with?('a')
  end
end
