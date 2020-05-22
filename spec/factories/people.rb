FactoryBot.define do
  factory :person do
    name { 'MyString' }
    document { 555_666_555 }
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
  end
end
