class CreateAnimalKinds < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
