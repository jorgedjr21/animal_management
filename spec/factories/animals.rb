FactoryBot.define do
  factory :animal do
    name { 'MyString' }
    monthly_cost { 1.5 }
    association :animal_kind
    association :owner, factory: :person
  end
end
