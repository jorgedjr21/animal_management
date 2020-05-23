class Animal < ApplicationRecord
  belongs_to :animal_kind
  belongs_to :owner, :foreign_key => 'person_id', class_name: 'Person'
end
