FactoryBot.define do
  factory :person do
    name { 'MyString' }
    sequence(:document)
    birthdate { '2020-05-22' }

    trait :wrong_name do
      name { '' }
    end

    trait :wrong_document do
      document { 'testing' }
    end

    trait :wrong_birthdate do
      birthdate { '' }
    end

    trait :underage do
      birthdate { Date.today - 5.years }
    end

    trait :with_animal do
      after(:create) do |person|
        create(:animal, person_id: person.id)
      end
    end
  end
end
