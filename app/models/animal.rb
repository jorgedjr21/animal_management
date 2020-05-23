class Animal < ApplicationRecord
  belongs_to :animal_kind
  belongs_to :owner, :foreign_key => 'person_id', class_name: 'Person'

  validates :name, presence: true, allow_blank: false
  validates :monthly_cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :animal_kind_id, presence: :true
end
