FactoryBot.define do
  factory :animal do
    name { 'MyString' }
    monthly_cost { 1.5 }
    association :animal_kind
    association :owner, factory: :person

    trait :wrong_name do
      name { '' }
    end

    trait :wrong_document do
      monthly_cost { -20.00 }
    end
  end
end
