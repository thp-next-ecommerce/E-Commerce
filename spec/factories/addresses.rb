FactoryBot.define do
  factory :address do
    street_name_1 { "MyString" }
    street_name_2 { "MyString" }
    city { "MyString" }
    post_code { 1 }
    country { "MyString" }
    profile { nil }
  end
end
