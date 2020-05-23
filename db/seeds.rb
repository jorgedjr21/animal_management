# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '---INSERTING ANIMAL KINDS---'
AnimalKind.create([
  { name: 'Gato' },
  { name: 'Cachorro' },
  { name: 'Andorinha' },
  { name: 'Cavalo' },
  { name: 'Papagaio' },
  { name: 'Lhama' },
  { name: 'Iguana' },
  { name: 'Ornitorrinco' }
])
puts '---FINISH INSERT ANIMAL KINDS---'
puts '-----------------------------'
puts '---START INSERTING PEOPLE---'
people = [
  { name: 'Johnny Cash', document: '555555555', birthdate: '26/02/1932' },
  { name: 'Sid Vicious', document: '555555555', birthdate: '10/05/1957' },
  { name: 'Axl Rose', document: '555555555', birthdate: '06/02/1962' },
  { name: 'Joey Ramone', document: '555555555', birthdate: '19/05/1951' },
  { name: 'Bruce Dickinson', document: '555555555', birthdate: '07/08/1958' },
  { name: 'Kurt Cobain', document: '555555555', birthdate: '20/02/1967' },
  { name: 'Elvis Presley', document: '555555555', birthdate: '17/08/2008' }
]

people.each do |person|
  puts "\t-INSERTING PERSON #{person[:name].upcase}-"
  new_person = Person.new(person)
  new_person.save!
  puts "\t-FINISH INSERT PERSON #{person[:name].upcase}-"
end
puts '---FINISH INSERTING PEOPLE---'
puts '-----------------------------'
puts '---START INSERTING ANIMALS---'
  animals =[
    {
      name: 'Pé de pano', monthly_cost: 199.99, person_id: Person.find_by(name: 'Johnny Cash').id , animal_kind_id: AnimalKind.find_by(name:'Cavalo').id
    },
    {
      name: 'Réx', monthly_cost: 99.99, person_id: Person.find_by(name: 'Sid Vicious').id , animal_kind_id: AnimalKind.find_by(name:'Cachorro').id
    },
    {
      name: 'Ajudante do Papai Noel', monthly_cost: 99.99, person_id: Person.find_by(name: 'Axl Rose').id , animal_kind_id: AnimalKind.find_by(name:'Cachorro').id
    },
    {
      name: 'Rex', monthly_cost: 103.99, person_id: Person.find_by(name: 'Joey Ramone').id , animal_kind_id: AnimalKind.find_by(name:'Papagaio').id
    },
    {
      name: 'Flora', monthly_cost: 103.99, person_id: Person.find_by(name: 'Bruce Dickinson').id , animal_kind_id: AnimalKind.find_by(name:'Lhama').id
    },
    {
      name: 'Dino', monthly_cost: 177.99, person_id: Person.find_by(name: 'Kurt Cobain').id , animal_kind_id: AnimalKind.find_by(name:'Iguana').id
    },
    {
      name: 'Lassie', monthly_cost: 407.99, person_id: Person.find_by(name: 'Elvis Presley').id , animal_kind_id: AnimalKind.find_by(name:'Ornitorrinco').id
    }
  ]

animals.each do |animal|
  puts "\t-INSERTING ANIMAL #{animal[:name]}"
  Animal.create(animal)
  puts "\t-FINISH INSERT ANIMAL #{animal[:name]}"
end

puts 'FINISH INSERTING ANIMALS'