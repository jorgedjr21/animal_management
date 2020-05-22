class Person < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :document, presence: true, numericality: { only_integer: true }
  validates :birthdate, presence: true, allow_blank: false

end
