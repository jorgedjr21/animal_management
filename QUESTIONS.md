# Questões

## Qual é o custo médio dos animais do tipo cachorro?

```ruby
costs = Animal.joins(:animal_kind).where(animal_kinds: { name: 'Cachorro'}).select(:monthly_cost)
costs.pluck(:monthly_cost).reduce(&:+) / costs.count
99.99
```

## Quantos cachorros existem no sistema?

```ruby
Animal.joins(:animal_kind).where(animal_kinds: { name: 'Cachorro'}).count
2
```

## Qual o nome dos donos dos cachorros (Array de nomes)?

```ruby
Animal.joins(:animal_kind, :owner).where(animal_kinds: { name: 'Cachorro'}).select('people.name').pluck('people.name')
["Sid Vicious", "Axl Rose"]
```

## Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)

```ruby
Person.joins(:animals).order('animals.monthly_cost DESC').select('people.name').pluck('people.name')
["Elvis Presley", "Johnny Cash", "Kurt Cobain", "Joey Ramone", "Bruce Dickinson", "Axl Rose", "Sid Vicious"]
```

## Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?

```ruby
Person.joins(:animals).select('people.name', 'animals.monthly_cost').map { |cost| { name: cost['name'], cost: (cost['monthly_cost'].to_f * 3).round(2)} } <br/>

[
  {:name=>"Johnny Cash", :cost=>599.97}, 
  {:name=>"Sid Vicious", :cost=>299.97}, 
  {:name=>"Axl Rose", :cost=>299.97}, 
  {:name=>"Joey Ramone", :cost=>311.97}, 
  {:name=>"Bruce Dickinson", :cost=>311.97}, 
  {:name=>"Kurt Cobain", :cost=>533.97}, 
  {:name=>"Elvis Presley", :cost=>1223.97}
]
```