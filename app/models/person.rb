class Person < ApplicationRecord
  has_many :animals, dependent: :destroy
  
  validates :name, presence: true, allow_blank: false
  validates :document, presence: true, numericality: { only_integer: true }
  validates :birthdate, presence: true, allow_blank: false

end
