FactoryBot.define do
  factory :collected_datum do
    value { 1.5 }
    numerator { 1.5 }
    denominator { 1.5 }
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    company { "MyString" }
    position { "MyString" }
  end
end
